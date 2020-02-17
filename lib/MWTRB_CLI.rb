require_relative "./MWTRB_CLI/"

module MWTRBCLI
  class Error < StandardError; end
  
  class CLI

    def clear_screen
      system "clear"
    end

    def display_welcome_message
      clear_screen
      puts "Welcome to MWRB-CLI".light_blue
      puts "Note: All data supplied by Merriam Webster's Thesaurus API".yellow
      puts "==========================================================\n".light_black
    end

    def display_error(error_message)
      puts "\nError: #{error_message}!".red
    end

    def prompt_choice(user_prompt)
      print "#{user_prompt}: ".light_yellow
      gets.chomp
    end

    def display_requested_word_info(info_category, info)
      puts "\n#{info_category}:".green + " #{info}\n".light_blue
    end
    
    def show_all_word_info(word_obj)
      clear_screen
      display_welcome_message
      display_requested_word_info("Word",word_obj.word)
      display_requested_word_info("Word Forms",word_obj.word_forms)
      display_requested_word_info("Definition",word_obj.definition)
      display_requested_word_info("Synonyms",word_obj.synonyms)
      display_requested_word_info("Antonyms",word_obj.antonyms)
      display_requested_word_info("Related Words:",word_obj.related_words)
    end

    def options_end_prompt(word_obj)
       exit_choice = prompt_choice("1. Go Back\t\t2. Lookup Another Word\t\t3. Exit Program")
        case exit_choice
        when "1"
          display_menu(word_obj)
        when "2"
          self.call
        when "q"
          exit
        when "3"
          exit
        else
          display_invalid_response_error
          options_end_prompt(word_obj)
        end
    end

    def display_invalid_response_error
      display_error("That is not a valid selection. Please press the enter key to try again")
          gets
    end

    def display_menu(word_obj)
      exit_flag = true

      while exit_flag
        clear_screen
        display_welcome_message
        puts "What would you like to see?"
        user_choice = prompt_choice("1. All Word Info  2. Definiton  3. Synonyms  4. Antonyms  5. Word Examples")

        case user_choice
        when "1"
          show_all_word_info(word_obj)
        when "2"
          display_requested_word_info("Definiton",word_obj.definition)
        when "3"
          display_requested_word_info("Synonyms",word_obj.synonyms)
        when "4"
          display_requested_word_info("Antonyms",word_obj.antonyms)
        when "5"
          display_requested_word_info("Word Examples",word_obj.word_examples)
        when "q"
          exit
        else
          display_invalid_response_error
          display_menu(word_obj)
        end
        options_end_prompt(word_obj)
      end
    end

    #==================== CLI CALL METHOD BELOW =======================

    def call
      api_obj = nil

      while api_obj == nil do

        display_welcome_message
        users_word = " "

        # Validation Case: Incorrect Format
  
        while !users_word[/\W/].nil?
          users_word = prompt_choice("Please enter the word to lookup")
          exit if users_word == "q"
          break if users_word[/\W/].nil?
            display_error("Incorrect Format: Word cannot be blank, or have a blank space in it")
            puts "Press the Enter key to continnue ...\n".red
            gets
            clear_screen
            display_welcome_message
        end

        # API Query Object Instantiated
        api_obj = API.new(users_word).get_data

        # If Users word is not found in the Thesaurus
        if(api_obj == nil)
          display_error("#{users_word} was not found in the Thesaurus!")
          user_choice = prompt_choice("\nWould you like to lookup another word (Y/n)")
          case user_choice
          when 'n'
            exit
          end
        end
      end
      
      #==================== CLI CALL METHOD ABOVE =======================

      # Instantiate a new word object
      word_obj = Word.new(api_obj)

      display_menu(word_obj)




    end

  end

end

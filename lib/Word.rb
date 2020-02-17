class Word

  attr_reader :word_obj,:word,:definition,:synonyms,:antonyms,:word_forms,:related_words,:word_examples

  def initialize(word_obj)
    @word_obj = word_obj
    @word = self.set_word
    @definition = self.set_definition
    @synonyms = self.set_synonyms
    @antonyms = self.set_antonyms
    @word_forms = self.set_word_forms
    @related_words = self.set_related_words
    @word_examples = self.set_word_examples
    self
  end

  def set_word
    @word = @word_obj["meta"]["id"].capitalize
  end

  def set_definition
    # Returns a String Definiton
    @word_obj["shortdef"].join(". ")
  end

  def set_synonyms
    # Returns an array of Synonyms
    @word_obj["meta"]["syns"][0]
  end

  def set_antonyms
    @word_obj["meta"]["ants"][0]
  end

  def set_word_forms
    @word_obj["meta"]["stems"]
  end

  def set_word_examples
    @word_obj["def"].first["sseq"].first.first[1]["dt"].last.last.first["t"].gsub('{it}',"").gsub("{/it}","")
  end

  def set_related_words
    @word_obj["def"].first["sseq"].first.first[1]["rel_list"].collect{|el| el.collect{|item| item["wd"]}}.flatten
  end

  def display_all_attributes
    word_obj
  end

end
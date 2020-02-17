class API

@@api_key = "63c82a0e-fcd3-438e-b601-44111e81d294"

  attr_accessor :word

  def initialize(word)
    @word = word
    self.get_data
  end

  def get_data
    link = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/#{@word}?key=#{@@api_key}"
    html = open(link).read
    
    # Validation Case: If results are empty
    if(JSON.parse(html) == [])
      return nil
    end

    # Validation Case: If not a word
    if(JSON.parse(html)[0]["meta"] == nil)
      return nil
    end

    JSON.parse(html).first
  end
end
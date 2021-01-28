# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  new_lib = {}
  library.each do |name, emo_array| 
    new_lib[name] = {:english => "", :japanese => ""}
    emo_array.each_with_index do |emoji, index|
      if index == 0 
        new_lib[name][:english] = emoji
        elsif index == 1 
        new_lib[name][:japanese] = emoji
      end
    end
  end
  new_lib
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  japanese_emoji = ""
  emoticon_hash.each do |name, lang_hash|
    if emoticon == lang_hash[:english] 
        japanese_emoji = lang_hash[:japanese]
        else "Sorry, that emoticon was not found"
    end
  end
  japanese_emoji
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  english_name = ""
  emoticon_hash.each do |name, lang_hash|
    if emoticon == lang_hash[:japanese]
      english_name = name
  
    end
  end
  english_name
  "Sorry, that emoticon was not found"
end
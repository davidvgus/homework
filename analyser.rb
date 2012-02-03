require 'win32console' if RUBY_PLATFORM =~ /mingw/
require 'logger'

$LOG = Logger.new('anal.log', 'monthly')
$LOG.level = Logger::DEBUG

=begin
doctest: Count characters in string
>> char_count("123456789")
=> 9
doctest: Count characters in string with spaces
>> char_count("123 456 789")
=> 11
doctest: Count non space characters in string
>> char_count("123 456 789", false)
=> 9
=end

def char_count(string, with_spaces = true)
  $LOG.debug("#{__method__} invoked.")
  if with_spaces
    string.length
  else
    string.scan(/\S/).length
  end
end

=begin
doctest: count lines in file
>> lines_in_file("text.txt")
=> 121
=end

def lines_in_file(file, return_contents = false)
  $LOG.debug("#{__method__}called with: " << file)
  number_of_lines = 0
  contents = ""
  begin
    raise IOError, "#{file} doesn\'t exist." unless File.exists?(file)
    File.open(file, 'r') do |f|
      while line = f.gets
        number_of_lines  += 1
        contents << line
      end
    end
  rescue IOError => e
    $LOG.fatal("IOError: #{e.message}")
    puts "#{file} doesn\'t exist."
    exit 1
  end

  if return_contents
    [number_of_lines, contents]
  else
    number_of_lines
  end
end

=begin
doctest: count paragraphs
>> paragraph_count("one\n\ntwo\n\nthree\n\nfour\n\nfive\n\nsix")
=> 6
=end

def paragraph_count(string)
  $LOG.debug("#{__method__} invoked.")
  string.split("\n\n").count
end

=begin
doctest: count sentences in string
>> sentence_count("Hi there!  How are you?  I'm dave.")
=> 3
=end

def sentence_count(string)
  $LOG.debug("#{__method__} invoked.")
  string.scan(/(.*!|.*\?|.*\.)/).length
end

=begin
doctest: count words in string
>> word_count("one two three four five six")
=> 6
doctest: test with empty string
>> word_count("")
=> 0
=end

def word_count(string)
  $LOG.debug("#{__method__} invoked.")
  string.scan(/\S+/).count
end




if __FILE__ == $0 then
  line_count, contents = lines_in_file("textblah.txt", true)
  stats = {:character_count => char_count(contents),
            :character_count_n_spaces => char_count(contents, false),
            :line_count => line_count,
            :word_count => word_count(contents),
            :sentence_count => sentence_count(contents),
            :paragraph_count => paragraph_count(contents)}
  stats[:average_number_of_sentences_per_paragraph] = stats[:line_count] / stats[:paragraph_count]
  stats[:average_number_of_words_per_sentence] = stats[:word_count] / stats[:sentence_count]

  stats.each do |k,v|
    puts "%-41s: %s" % [k, v]
  end
end



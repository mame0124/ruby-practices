# frozen_string_literal: true

require 'optparse'

def wc
  opt = OptionParser.new
  @options = {}
  opt.on('-l') { |v| @options[:l] = v }
  opt.on('-w') { |v| @options[:w] = v }
  opt.on('-c') { |v| @options[:c] = v }
  opt.parse!(ARGV)

  @lines_count = 0
  @words_count = 0
  @bytes_count = 0
  file_names = ARGV

  output(file_names)
end

def output(file_names)
  if file_names[0]
    file_names.each do |filename|
      print_count_with_filename(filename)
    end
    print_count_by_total if file_names[1]
  else
    txt = $stdin.read
    print_count_by_option_l(txt)
    print_count_by_option_w(txt)
    print_count_by_option_c(txt)
    print "\n"
  end
end

def print_count_with_filename(file_name)
  txt = File.read(file_name)
  print_count_by_option_l(txt)
  print_count_by_option_w(txt)
  print_count_by_option_c(txt)
  print " #{file_name}"
  print "\n"
end

def print_count_by_total
  print format('%8d', @lines_count) if @lines_count
  print format('%8d', @words_count) if @words_count
  print format('%8d', @bytes_count) if @bytes_count
  print ' total'
  print "\n"
end

def print_count_by_option_l(txt)
  return unless print_line_length?

  print format('%8d', txt.lines.count)
  @lines_count += txt.lines.count
end

def print_count_by_option_w(txt)
  return unless print_word_count?

  print format('%8d', txt.split.size)
  @words_count += txt.split.size
end

def print_count_by_option_c(txt)
  return unless print_byte_size?

  print format('%8d', txt.size)
  @bytes_count += txt.size
end

def print_line_length?
  @options.key?(:l) || @options.empty?
end

def print_word_count?
  @options[:w] || @options.empty?
end

def print_byte_size?
  @options[:c] || @options.empty?
end

wc

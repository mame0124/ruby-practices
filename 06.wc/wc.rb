# frozen_string_literal: true

require 'optparse'

def wc
  opt = OptionParser.new
  @options = {}
  opt.on('-l') { |v| @options[:l] = v }
  opt.on('-w') { |v| @options[:w] = v }
  opt.on('-c') { |v| @options[:c] = v }
  opt.parse!(ARGV)

  file_names = ARGV

  if file_names
    file_names.each do |filename|
      file_info_output(filename)
    end
  else
    txt = $stdin.read
    display(txt)
    print "\n"
  end
end

def file_info_output(file_name)
  txt = File.read(file_name)
  display(txt)
  print " #{file_name}"
  print "\n"
end

def display(txt)
  print format('%8d', txt.lines.count) if @options[:l] || @options.empty?
  print format('%8d', txt.split.size) if @options[:w] || @options.empty?
  print format('%8d', txt.size) if @options[:c] || @options.empty?
end

wc

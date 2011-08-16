require './compiler'
require 'optparse'

options = {}

optparse = OptionParser.new do |opts|
  
  opts.banner = "Usage:"
  
  options[:verbose] = false
  opts.on('-v', '--verbose', 'Print debug statements') { options[:verbose] = true}
  
  options[:filename] = nil
  opts.on('-f', '--filename FILENAME', 'The path to the source file') { |filename| options[:filename] = filename }
  
  options[:test_name] = nil
  opts.on('-t', '--test ANALYZER', 'Test the specified analyzer') {|test_name| options[:test_name] = test_name}
  
  opts.on('-h', '--help', 'Show this message') do
    puts opts
    exit
  end
  
end.parse!

if options[:test_name] && (options[:test_name].eql? 'lex')
  Compiler::Tests::Lex.test(options[:filename], options[:verbose])
else
  puts "Unknown options. Type --help for help."
  exit
end


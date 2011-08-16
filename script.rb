require 'compiler'

if ARGV[0].eql? 'test'
  if ARGV[1].eql? 'lex'
    Compiler::Tests::Lex.test ARGV[2]
  end
end
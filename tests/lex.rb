require './lexical'

module Compiler
  module Tests
    
    class Lex
      
      def self.test filename, verbose
        reader = Compiler::Lexical::Reader.new(filename, verbose)
        
        puts "Getting tokens for file #{filename}"
        
        tokens = []
        
        while (token = reader.next_token)
          tokens << token
        end
        
        puts ""
        puts "VALUE\t\tTYPE\t\tLINE\t\tCOL"
        puts "--------------------------------------------------------------"
        tokens.each do |token|
          puts "#{token.value}\t\t#{token.type}\t\t#{token.line}\t\t#{token.column}"
        end
        puts ""
        
        puts "Finished!"
        
      end
      
    end
    
  end
end
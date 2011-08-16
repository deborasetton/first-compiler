require 'lexical'

module Compiler
  module Tests
    
    class Lexical
      
      def self.test filename
        reader = Compiler::Lexical::Reader.new(filename)
        
        puts "Getting tokens for file #{filename}"
        puts ""
        puts "VALUE     TYPE      LINE      COL"
        
        while (token = reader.next_token)
          
          puts "#{token.value}  #{token.type} #{token.line} #{token.column}"
        
        end
        
        puts "finished!"
        
      end
      
    end
    
  end
end
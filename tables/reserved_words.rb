module Compiler
  module Tables
   
    class ReservedWords
      
      def initialize
        #puts "beggining..."
        @reserved_words = ['BEGIN', 'END', 'INT', 'PUTS']
      end
      
      def is_reserved? word
        
        #puts "Checking word #{word}. Is reserved: #{@reserved_words.include? word}"
        
        @reserved_words.include? word
      end
      
      
    end # ReservedWords
   
  end # Tables
end # Compiler
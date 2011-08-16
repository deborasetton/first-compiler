module Compiler
  module Tables
   
    class ReservedWord
      
      def initialize
        self.reserved_words = ['BEGIN', 'END', 'INT', 'PUTS']
      end
      
      def is_reserved? word
        self.reserved_words.include? word
      end
      
      
    end # ReservedWords
   
  end # Tables
end # Compiler
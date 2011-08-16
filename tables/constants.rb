module Compiler
  module Tables
    
    class Constants
      
      def initialize
        self.constants = []
      end
      
      def contains? constant
        return self.constants.include? constant
      end
      
      def add constant
        unless contains?(constant)
          self.constants << constant          
        end
      end
      
    end # Constants
    
  end # Tables
end # Compiler
module Compiler
  module Tables
    
    class Symbols
      
      def initialize
        self.symbols = {}
      end
      
      def contains? value
        if name.class == String
          return self.symbols[value]
        elsif name.class == Symbol
          return self.symbols[value.name]
        else
          raise "Unknown symbol type: #{value.class}"
        end
      end
      
      def get_symbol name
        
      end
      
      def add name, type
        unless contains?(name)
          s = Symbol.new(:name => name, :type => type, :index => self.symbols.keys.count)
          self.symbols[symbol.name] = s
        end
      end
      
    end # Symbols
    
    
    
  end # Tables
end # Compiler
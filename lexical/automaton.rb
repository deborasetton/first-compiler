module Compiler
  module Lexical
    
    #
    # This class represents the automaton that recognizes a token in the X language.
    #
    class Automaton
      
      attr_accessor :state, :word
      
      #
      # Initializes the automaton in its initial state.
      #
      def initialize
        
        @state = :A
        @word = ""
        @type = :undefined
        
      end
      
      def transition input
        
        @state = eval "state#{@state.to_s}(#{input})"
        
      end
      
      def stateA input
        if input =~ Compiler::BLANK
          @state = :A
        elsif input =~ /\$/
          @state = :B
          @type = :identifier
          @word =+ input
        elsif input =~ Compiler::ID
          @state = :C
          @type = :identifier
          @word += input
        elsif input =~ Compiler::NUMBER
          @state = :E
          @type = :constant
          @word += input
        elsif input =~ Compiler::SYMBOLS
          @state = :T
          @type = :symbol
          @word += input
        else
          @state = :failed
        end
        
        return input
      end
      
      def stateB input
        if input =~ /[a-zA-Z]/
          @state = :C
          @word += input
        else
          @state = :failed
          return {:done => false, :error => "Unexpected #{input}. Identifiers must begin with a letter."}
        end
        
        return input
      end
      
      def stateC input
        if input =~ /[a-zA-Z0-9]/
          @state = :C
          @word += input
        else
          @state = :A
        end
      end
      
      def stateE input
        if input =~ /[0-9]/
          @state = :E
          @word += input
        else
          @state = :A
        end
      end
      
      def stateT input
        @state = :A
      end
      
      
    end # Automaton
    
  end # Lexical
end # Compiler
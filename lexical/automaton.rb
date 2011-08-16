module Compiler
  module Lexical
    
    #
    # This class represents the automaton that recognizes a token in the X language.
    #
    class Automaton
      
      #
      # Regular expressions used in the transitions
      # 
      
      ID = /$?[a-zA-Z][a-zA-Z0-9]*/
      NUMBER = /[0-9]+/
      SYMBOLS = /[=\+\-\*\/\(\)\$;]/
      BLANK = /[\n\t ]+/
      
      #
      # Accessors
      #
      attr_accessor :state, :word, :type
      
      #
      # Initializes the automaton in its initial state.
      #
      def initialize
        @state = :A
        @word = ""
        @type = :undefined
      end
      
      def transition input
        
        puts "Transitioning with input #{input} and state #{@state.to_s}"
        
        #stateA("$")
        eval "state#{@state.to_s}(\"#{input}\")"
        
      end
      
      def stateA input
        if input =~ BLANK
          #puts "Went to A"
          @state = :A
        elsif input =~ /\$/
          #puts "Went to B"
          @state = :B
          @type = :identifier
          @word += input
        elsif input =~ ID
          #puts "Went to C"
          self.state = :C
          @type = :identifier
          @word += input
        elsif input =~ NUMBER
          #puts "Went to E"
          @state = :E
          @type = :constant
          @word += input
        elsif input =~ SYMBOLS
          #puts "Went to T"
          @state = :T
          @type = :symbol
          @word += input
        else
          @state = :Z
          @word += input
        end
        
        return input
      end
      
      def stateB input
        if input =~ /[a-zA-Z]/
          @state = :C
          @word += input
        else
          @state = :A
        end
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
      
      def stateZ input
        @state = :A
      end
      
      
    end # Automaton
    
  end # Lexical
end # Compiler
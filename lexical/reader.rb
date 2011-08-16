module Compiler
  module Lexical
  
    class Reader
    
      attr_accessor :filename
    
      #
      # Creates a new reader object, opening a file.
      #
      def initialize(filename, verbose)
      
        begin
          @file = File.open(filename, 'r') {|f| f.read}
          puts Compiler::color_out("Opened file #{filename}", :green) if @verbose
        rescue Exception => ex
          puts Compiler::color_out("[error] Couldn't open file #{filename}", :red)
        end
        
        # Marks the next character to be read in the file.
        @pos = 0
        
        # Counter for the line.
        @line = 0
        
        # Counter for the column.
        @column = 0
        
        # Holds the option that was passed.
        @verbose = verbose

      end
    
      #
      # Reads the next token and returns it.
      #
      def next_token
      
        # Early return if there is nothing to be read. This means we've reached the end of the file.
        
        unless @file[@pos]
          return nil
        end
      
        # This is the token that will be returned.
        token = Compiler::Token.new
      
        # Initializes a new instance of the automaton.
        automaton = Automaton.new
      
        # Will be set inside the loop, if necessary.
        increment_next = false
        
        # Will be set inside the loop. Marks whether we've reached the end of the file.
        eof = false
      
        # Build a new token while we don't have a new word yet and isn't in the failed state
        while ((automaton.state != :A || automaton.word.empty?) && automaton.state != :failed)
          
          # The next input for the automaton
          char = @file[@pos]
          
          if char
            
            # Moves the pointer to the next char
            @pos += 1
          
            automaton.transition(char)
            
            # While the automaton hasn't started to build a new word yet, increments the line and column numbers.
            # In this phase, we're just skipping blank characters
            if automaton.word.empty?
              if increment_next
                if char == "\n"
                  increment_next = true
                else
                  increment_next = false
                end
                @line += 1
                @column = 0
              elsif char == "\n"
                @column += 1
                increment_next = true
              else
                @column += 1
              end
            end
            
          else
            eof = true
            puts "breaking"
            break
          end
        end
      
      
      
        if eof
          automaton.transition("\n")
        else
          @pos -= 1
        end
        
        if (automaton.type == :identifier) &&  (Compiler.reserved_words.is_reserved?(automaton.word))
          token.type = :reserved_word
        else
          token.type = automaton.type
        end
        
        token.value = automaton.word
        token.line = @line
        token.column = @column
        
        return token
    
      end 
    
    
    
    end # Reader
  
  end # Lexical
end
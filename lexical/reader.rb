module Lexical
  
  class Reader
    
    attr_accessor :filename
    
    #
    # Creates a new reader object, opening a file.
    #
    def initialize(filename)
      
      begin
        @file = File.open(filename, 'r') {|f| f.read}
        @filename = filename
        @pos = 0
        @automaton = Automaton.new
        @line = 0
        @column = 0
      rescue Exception => ex
        puts color_out("[error] Couldn't open file #{filename}", :red)
      end
      
    end
    
    #
    # Reads the next token and returns it.
    #
    def next_token
      

      
      new_token = nil
      
      char = @filename[@pos]
      
      automaton = Automaton.new
      
      increment_next = false
      eof = false
      
      # Doesn't have a new word yet and isn't in the failed state
      while ((automaton.state != :A || automaton.word.blank?) && automaton.state != :failed)
        if char = @filename[@pos]
          
          if automaton.word.blank?
            if increment_next
              @line += 1
              @column = 0
            elsif char == "\n"
              @column += 1
              increment_next = true
            else
              @column += 1
            end
          end
          
          automaton.transition(char)
        else
          eof = true
        end
      end
      
      if eof
      else
        token.type = automaton.type
        token.value = automaton.word
      end
        
      
    
    end 
    
    
    
  end # Reader
  
end # Lexical
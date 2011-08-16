module Compiler
  
  ID = /$?[a-zA-Z][a-zA-Z0-9]*/
  NUMBER = /[0-9]+/
  PALAVRA_RESERVADA = /BEGIN|END|INT|PUTS/
  SYMBOLS = /[=\+-\*\/\(\)\$;]/
  BLANK = /[\n\t ]+/
  
  #
  # Returns a colored string to be printed to the shell.
  #
  def color_out(str, color)
    case color
      when :black
        "\033[30m#{str}\033[0m"
      when :red
        "\033[31m#{str}\033[0m"
      when :green
        "\033[32m#{str}\033[0m"
      when :yellow
        "\033[33m#{str}\033[0m"
      when :blue
        "\033[34m#{str}\033[0m"
      when :magenta
        "\033[35m#{str}\033[0m"
      when :cyan
        "\033[36m#{str}\033[0m"
      when :white
        "\033[37m#{str}\033[0m"
      else
        raise "Unknown color: #{color.to_s}"
      end
  end
  
  
end

require 'lexical'
require 'symbol'
require 'tables'
require 'tests'
require 'token'
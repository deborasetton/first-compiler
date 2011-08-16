
PROGRAMA = "BEGIN" ( e | ("INT" ID "=" EXPRESSAO | "PUTS" EXPRESSAO) ";" ) { e | ("INT" ID "=" EXPRESSAO | "PUTS" EXPRESSAO) ";" } "END"

EXPRESSAO = ("(" EXPRESSAO ")" | ID | ["+" | "-"] NUMBER) { ("*" | "/") ("(" EXPRESSAO ")" | ID | ["+" | "-"] NUMBER) } 
  { ("+" | "-") ("(" EXPRESSAO ")" | ID | ["+" | "-"] NUMBER) { ("*" | "/") ("(" EXPRESSAO ")" | ID | ["+" | "-"] NUMBER) } }
  



#NUMBER = DIGITO { DIGITO }
#COMANDO = e | "INT" ID "=" EXPRESSAO | "PUTS" EXPRESSAO


#
# EXPRESSOES REGULARES
#


ID = /$?[a-zA-Z][a-zA-Z0-9]*/
NUMBER = /[0-9]+/
PALAVRA_RESERVADA = /BEGIN|END|INT|PUTS/
SIMBOLOS = /[=\+-\*\/\(\)\$;]/
ESPACO = /[\n\t ]+/
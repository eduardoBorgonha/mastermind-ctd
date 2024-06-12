#esse programa serviu para gerar as sequências aleatórias presentes dos arquivos ROMx.vhd
#obs:o código está feio e mal escrito mas cumpriu seu propósito 
from random import randint as r
from re import sub

def binary_number_generator(size): #o parametro size indica qual o valor máximo que o número pode atingir
    for i in range(16):
        decimal = []
        binary = []
        for j in range(4): 

            decimal.append(r(0, size))#numero aleatório entre 0 e size
            binary.append(bin(decimal[j]).removeprefix('0b'))#formata para que o binário saia da maneira correta

            for k in range(4  - len(binary[j])): #completa com 0s faltantes para que cada número tenha 4 bits
                binary[j] = '0' + binary[j]

        str_bin = binary[0] + binary[1] + binary[2] + binary[3] #concatena os elementos
        str_bin = sub('[ ]','', str_bin) #remove todos os espaços da string

        print(i, str_bin, *decimal, sep=' ')
        


#de 0 a max:
max = 9
print(f"0 - {max}:")
binary_number_generator(max)


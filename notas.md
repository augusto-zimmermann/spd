# Examen

## Fabio

Aprobas la parte teoria, tiene un poquito mas de peso que el de assembler. Si recuperas es muy posible que **no** puedas promocionar. OJO

*FABIOGPT*

pueden desgrabar todas las clases...?

*Saber cuando es overflow*

## Assembler

Si recuperas bien, podes promocionar. Se recupera si aprobas bien el segundo. Por experiencia, el que desaprueba estrepitosamente el primero, el segundo tambien. en el mejor de los casos 8 de 40 pudieron. Se valora el esfuerzo y se trata de no mandarlo a final. Que no sea un ahorcado, una alarma

Recorrer el texto, moverse, dificultad, limpiar variable que quede bien. Si salen bien los ejercicios, deberiamos poder resolver el examen tranquilamente

Leer un texto de una forma, recorrerlo de otra. Forzar un texto a que sea tal cosa, despues contar la cantidad. Puede estar bien programado, si funciona esta bien. No se va a poner a revisar todo porque realentiza la correccion

Es **UN SOLO EJERCICIO PRACTICO**. El resto es teoria de assembler

No deberia generar ninguna dificultad para rendir el examen

Tienen un sustento teorico, no podes hacer memoria a memoria. Interesa que sepas que `[bx] si` no se puede. Mas que nada saber que se puede, que no. Que tiene sentido, que no. Manejar tamaños de variables son dos, que registros sirven para que cosa. Que hace cadcda uno donde se usa y que funcion cumple

leer intel, conocerlo al menos por arriba

bx base
cx contador

no podes meter una variable de 16 bits en algo de 8 bits. Seguramente algo de bytepointer porque lo vimos la clase pasada

*Dividirse mitad y mitad*


Podemos hacer todos los ejercicios salvo el de mascaras de red y calculadora

```
Lucas Rimbano
20:16
podriamos hacer un ejercicio tipo contar palabras y convertir en binario el resultado  o algo asi

Respuesta:
No voy a tomar eso Lucas
```

## reg2asc

una variable que fue contabilizada
convertirlo a un sistema que el sist puede imprimir
un numero que como mucho tiene 255
un valor que es db
variable 3 bytes cada uno corresponde a un asccii 000 a 205
primero por 100, luego por 10 luego por 1 a fin de quedarse con los resultados que son el insumo para poder llenar el valor. 
Si divido 332 y lo divido 100 queda 2 y 32 el resto. Hay que sumarle 30h o una variable que tenga 30h. Porque si no no se puede imprimir. El caracter asccii correspondiente al numero 2 es una carita. Necesitas convertirlo sumando 30h
despues agarro ese 32 lo meto adentro de `al`, limpias la otra variable
el 2 lo pasas a `al`

algo paso en el medio y no pude escribir mas

cuando pega la vuelta, vuelve a hacer lo mismo con el 10 y despues con el 1

## cosas a binario

una forma de poder trabajar bit a bit, con lo que vos estas trabajando. Adentro de este numero.
Trabajamos con un valor, en este caso un texto de 8 bytes. Tiene condiciones para que si o si lea 0 o 1. Tenemos que ir fabricando nuestro binario. con dos operaciones shift left y despues add 1 o inc 1. si yo muevo todo multiplicandolo por su base, cuando le sumo 1. Corro y sumo Corro y sumo. Cuando lo haga 8 veces voy a tener un numero armado
 
El bit que se cae po la izquierda, puede que vaya al carry. Se va a prender cuando sea un 1. Cuando pasa incremente 1 bx
Va metiendole valores de aca hasta la ultima 
inc [bx] 1
Si quiero hacer una conversion interna de una lectura a un registro. Voy checkeando que valor tiene y voy viendo. si tiene un 1 etcetc

pasar de binario a decimal no hace falta nada. una vez que ya tenes el valor en el registro, lo podes interpretar como quieras.

Si queres agarrar un binario que cargaste en texto es `cosas a binario`. Si tenes un 1, shifteas e incrementas. Si es un 0, shifteas. Asi arma el numero

Cuando planchas el registro

xor aplica la operacion que corresponde con la compuerta. solamente da positivo cuando los dos son distintos. si tengo dos variables con dos valores distintos, da positivo

para loops solamente cx, repite una tarea de una forma particular. NO SE CUENTA LA POSICION 0, TENGO QUE PONER CANTIDAD. En el momento que haces el loop, el sistema decrementa solo

bx va a memoria

add [bx], 01010101b va a andar

[bx] para recorrer una variable
[si] para recorrer otra


# Notas video SPD

Charles Babbage inventor del deflector de obstaculos ferrocarril para ganado
Padre del ordenador
Cometian errores con frecuencia, empezo con engranajes
Tarjetas perforadas, motor analitico
Colapso antes de probarlo

final siglo 19
censo 1987
german Holleret
la gente perforaba las tarjetas, se registraban los resultados en diales (como de reloj)
negocios con trenes (obvio)
fundo una compania que seria la base de la ibm

ALAN TURING
Colosos, para romper el codigo enigma, 25000 caracteres por segundo, solo podia unir letras
Ultrasecreto

tablas de disparo para artilleria

Durante la segunda guerra mundial, era imposible realizarlas a tiempo. John Mockley ordenador gigante electronico. medio millon de dolares
Enia integrador numerico electronico y ordenador
mucho mas grande que el colosos
tubos que funcionaban como bombillas, por lo menos uno habia que cambiarse cada dos minutos
podia reconfigurarse para otros problemas
todos pedian usarla
memoria muy primitiva 20,10 numeros decimales
no podia tomar decisiones logicas


John von neuman
proyecto manhattan
unidad de procesamiento y control
internamente conteniendo programas
maquina general de propósito
memoria para almacenar datos
mapa de un ordenador
Ecker y mockley
univac
amable para solucionar problemas comercialmente nominas inventario financiciona cinta magnetica para grabar datos
predice presidente eisenhower

60 ibm
cambio de tecnologia tubo a transistores


llegar a la luna
se reduce el tamaño

transistor
mas fiable y pequeño
silicio y cable diminuto
si no hay corriente, actua como aislante

circuito integrado
orbita lunar
tierra
mas potentes
microprocesador
intel
apple one
kit de ordenadores automontaje
altair
400 dolares

ordenador molecular
cambio de forma, cuando tienen una estan prendidas o apagadas
cables diminutos
de dos atmos de largo y 2 de ancho. iridio en superficie de silicio para hacer una serie de cables

adn o particulas quantum
alan turing predijo la inteligencia artificial TEST DE TURING



## config DOSBOX

### AL PRINCIPIO

fullscreen=false
fulldouble=false
fullresolution=1200x600
windowresolution= 1200x600
output=opengl
autolock=false
sensitivity=100
waitonerror=true
priority=higher,normal
mapperfile=mapper-0.74-3-3.map
usescancodes=true

### AL FINAL

Keyb sp
Doskey
Mount c: /Users/pedro/tasm
Set path=%path%;c:\
c:
#Cd tpfinal


PODES CAMBIAR LA VELOCIDAD DEL PROCE, ETC

# Orden ej
1
2
4
5
3
6
7
8

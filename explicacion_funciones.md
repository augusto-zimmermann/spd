# el examen se resuelve con nuestras librerias

funciones publicas y privadas

si es una cosa interna

publicas las funciones que vayan a andar

puedo tener variables que se llamen igual
el tlink se va a encargar de cambiar esas etiquetas por nombres reales, y no va a ser un problema

si quiero llamar funciones, tenes que publicarlas primero con `public`

tlink main proceso
> para hacer los ejercicios juntos en tlink

no podes hacer `tasm main proceso`

```bash
tasm %1 # parametro 1
tasm %2 # parametro 2

o

tasm /zi %1
tasm /zi %2
tlink /v %1 %2
tlink %1 %2
td %1.exe # para turbodebugger

```

guardas como compi.bat

C> compi main proceso

view
    main
    proceso

listo funciones externas

2 cosas
    funcion externa como caja de carga
    interrupciones

hay mil videos de funciones externas
interrupciones es mas jodido

no
no existe call caja de cambio

yo puedo llamar a una interrupcion cuando sea

## Interrupciones

estan programasdas en otro modo
no tengo un espacio personalizado para cs
.com: programa ejecutable que no tiene stack

```asm
start
    jmp main
```

va a formar parte del codigo que va a quedar instalado en la memoria, lo que esta abajo es la instalador

- programa que instale
- programa que queda fijo en la memoria

todas las interrupciones van a tener un bloque de codigo cuando llame la int

los instaladores son todos iguales, lo unico que varia es la posicion de vector donde se va  guardar el codigo

### La dificil

lee una tecla del teclado y la va a eliminar. a partidr del moemnto que apreto la tecla, la elimina

int 16
cuando pongo 0 en ah, devuelve en al el asccii el ascci de la tecla
scancode, se necesita para jueguitos
lo que devuelve el teclado en crudo cuando apretamos una tecla

para comparar en el momento que se aprete otra tecla

dejar residente: que no se borren las cosas de memoria cuando el programa esta apagado

35 le pide la isr donde esta instalada esa interrupcion
a donde esta apuntando el servicio 9?

en bx obtengo el desplazamiento de la memoria
cuando tenemos una variable, si decis jmp juancito
juancito despues se cambia a un bloque de memoria (jmp 05, jmp 0a)
desde el 0 de segmento, cuanto esta corrida esa etiqueta

25 pisa esa isr
ahora apunta a donde yo te digo

cuando no sea esa tecla, voy a llamar a la anterior

dejar residente en memoria

fijate que el programa no termina en `4100h`, si no en `3100h`
31 no borra la memoria
00 que no hay error

le tengo que pasar en dx la cantidad de bloques de 16 bytes (paragraph)

la cantidad de renglones desde el principio de segmento de codigo

missakey
Vuelve a interrumpir interrupciones
va a pushear ax, va a ler el puerto de teclado
pollea el teclado
llama al puerto de teclado
guarda la tecla en `al`

### La sencilla



## el tp final tiene que tener SI O SI UNA INTERRUPCION

vamos a hacer nuestras funciones, para el examen y para el tp final
podemos compartir funciones entre nosotros
podemos usar las funciones de pedro
que podamos usar las funciones no significa que 

como funciona la variable
abajo de code pongo extrn carga:proc

poriamos hacer otro servicio donde pasamos la variable de los caracteres por parametro


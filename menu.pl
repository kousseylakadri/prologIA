%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                MAIN                 %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

opt1 :- nl,
        write('Escribe los nombres completamente en minúsculas,'), nl,
        write('seguidos de un punto.'), nl,
        nl,
        instrucciones.

opt2 :- nl,
        write('Escribe los nombres completamente en minúsculas,'), nl,
        write('seguidos de un punto.'), nl,
        nl,
        generaRuta.


instrucciones :- write('En esta sección existen dos funciones'),
					write('1. estaciones(Linea)'),
					write('2. extremos(Linea)'),
					write('Donde: Linea es el numero o letra de la linea que quieres consultar'),
					write('Nota: escribe las linea de la siguiente forma: 1,2,3,4,a,b,etc.'), 
					read(Option).
                 

generaRuta :- write('¿Cúal es tu estación de salida?'),
				read(Origen),nl,
			  write('¿Cúal es tu estación destino?'),
			  	read(Destino),nl,
			  	encuentraRuta(Origen,Destino).


% Programa que muestra un menu
pausa :-	nl,
			write('Presiona <enter> para continuar '),
			skip(10).


% Limpia pantalla
borraPantalla :- borraLinea(10).
borraLinea(1) :- !,nl.
borraLinea(N) :- nl,N1 is N-1,borraLinea(N1).

% Escribe caracteres
escribe([]).
escribe([X|Y]):- put(X),
	escribe(Y).

%Mensaje de error
error:- borraPantalla,
	escribe("¡¡¡ Opcion invalida !!!"), nl,
	pausa.

%Mensaje antes de salir
salida:- borraPantalla,
	 escribe("|------------------PROLOG----------------------|"),nl,
	 escribe("|------------Inteligencia Artificial-----------|"),nl,
	 escribe("|----------------------------------------------|"),nl,
	 escribe("|--Altamirano Peralta David--------------------|"),nl,
	 escribe("|--Guerra Vicente------------------------------|"),nl,
	 escribe("|-------------------------------------Byte-----|"),nl,
	 pausa,
	 halt.

/*Opciones*/

opciones(X):-  ((X = 1) -> opt1,nl,;
		      	(X = 2) -> escribe("Opcion 2"),nl,pausa;
		       	(X = 3) -> salida;
		     	error).

menu:- borraPantalla,
		escribe("-----------PROYECTO FINAL--------------"),nl,
		escribe("----------SISTEMA  EXPERTO-------------"),nl,
	    escribe("-----------Menu principal--------------"),nl,
	    escribe("Selecciona una opción."),nl,
	    escribe("Opciones: "),nl,
	    tab(10),escribe("1) Consultar las estaciones de una linea."),nl,
	    tab(10),escribe("2) Generar ruta de viaje."),nl,
	    tab(10),escribe("3) Salir"),nl,
	    escribe("Tu opcion es: "), read(X),
	    opciones(X),
	    menu.

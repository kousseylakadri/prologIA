%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                MAIN                 %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


opt1 :- consult('bdc.pl'),
        nl,
        write('Escribe los nombres completamente en minúsculas,'), nl,
        write('seguidos de un punto.'), nl,
        nl,
        consultaLinea.

opt2 :- consult('bdc.pl'),
        nl,
        write('Escribe los nombres completamente en minúsculas,'), nl,
        write('seguidos de un punto.'), nl,
        nl,
        consultar.


consultaLinea :- write('Que linea deseas consultar?'),
                   read(Numero),
                   linea(Numero,r).

linea(N,E) :- estacion(N,E,_,_).

generaRuta :- write('¿Cúal es tu estación de salida?'),
				read(Origen),nl,
			  write('¿Cúal es tu estación destino?'),
			  	read(Destino),nl,
			  	ruta(Origen,Destino).


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
	 escribe("|----------- Inteligencia Artificial-----------|"),nl,
	 escribe("|-------------------------------------Adios----|"),nl,
	 pausa,
	 halt.

/*Opciones*/

opciones(X):-  ((X = 1) -> opt1,nl,pausa;
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

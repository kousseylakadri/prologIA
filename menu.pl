%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                MAIN                 %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

login:- write('usuario: '),
 		read(User), nl,
 		write('contraseña: '), 
 		read(Pass),
 		admin(User,Pass),	
 		menuadmin.

start :-escribe("-----------Menu Acceso--------------"),nl,
	    escribe("Selecciona una opción."),nl,
	    escribe("Opciones: "),nl,
	    tab(10),escribe("1. Usuario."),nl,
	    tab(10),escribe("2. Administrador."),nl,
	    escribe("Escribe tu opcion seguida de un punto."),nl,	
	    escribe("Tu opcion es: "), read(X),
	    startopt(X).

startopt(X) :- ((X = 1) ->menu,nl;
			 (X = 2) ->login,nl;
			 error).

menuadmin :-consult('alfa.pl'), 
			write('Introduce el numero o letra de la nueva linea'),nl,
		   read(Linea),
		   \+ linea(Linea,_),
		   write('Ahora las estaciones que tendrá.'),nl,
		   write('Cada estacion debe introducirse en minúsculas,'),nl,
		   write('los espacios deben sustituirse por guiones bajos'),nl,
		   write('seguidos de un punto.'),nl,
		   agregaEstacion(Estacion),
		   creaEstacion(Linea,Estaciones).

agregaEstacion(Estacion) :- read(Estacion),
							append(Estacion,Estaciones,Estaciones),
							agregaEstacion(NuevaEst).

agregaEstacion(ok) :- .

submenu1 :- write('En esta sección existen dos funciones'),nl,
			tab(10),write('1. Listar las estaciones de una linea.'),nl,
			tab(10),write('2. Listar las terminales de una linea.'),nl,
			escribe("Tu opcion es: "), read(X),
			opciones1(X).

opt1_1 :- nl,
	      write('¿Qué linea deseas consultar?'),nl,
	      write('linea puede tomar los valores:'),nl,
	      write('1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, 12'),nl,
	      read(W),
	      estaciones(W),
	      pausa.

opt1_2 :- nl,
	      write('¿Qué linea deseas consultar?'),nl,
	      write('linea puede tomar los valores:'),nl,
	      write('1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, 12'),nl,
	      read(W),
	      extremos(W),
	      pausa.

opt2 :- nl,
        write('Escribe los nombres completamente en minúsculas,'),nl,
        write('seguidos de un punto.'),nl,
        write('Los espacios en blanco sustituyelos con,'),nl,
        write('un guión bajo, ejemplo: indios_verdes.'),nl,nl,
        generaRuta.

         
opciones1(X):-  ((X = 1) -> opt1_1,nl;
		      	 (X = 2) -> opt1_2,nl;
		     	 error).

generaRuta :- write('¿Cúal es tu estación de salida? '),
				read(Origen),nl,
			  write('¿Cúal es tu estación destino? '),
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
salida:- escribe("|--------------------PROLOG--------------------|"),nl,
		 escribe("|------------Inteligencia Artificial-----------|"),nl,
		 escribe("|----------------------------------------------|"),nl,
		 escribe("|--Altamirano Peralta David--------------------|"),nl,
		 escribe("|--Guerra Hernández Vicente--------------------|"),nl,
		 escribe("|-------------------------------------Byte-----|"),nl,
		 pausa,
		 halt.

/*Opciones*/

opciones(X):-  ((X = 1) -> submenu1,nl;
		      	(X = 2) -> opt2,nl,pausa;
		       	(X = 3) -> salida;
		     	error).

menu:-  consult('alfa.pl'),
		escribe("-----------PROYECTO FINAL--------------"),nl,
		escribe("----------SISTEMA  EXPERTO-------------"),nl,
	    escribe("-----------Menu principal--------------"),nl,
	    escribe("Selecciona una opción."),nl,
	    escribe("Opciones: "),nl,
	    tab(10),escribe("1. Consultar las estaciones de una linea."),nl,
	    tab(10),escribe("2. Generar ruta de viaje."),nl,
	    tab(10),escribe("3. Salir"),nl,
	    escribe("Escribe tu opcion seguida de un punto."),nl,	
	    escribe("Tu opcion es: "), read(X),
	    opciones(X),
	    menu.

% Administradores

admin(admin,admin).
admin(david,1234).
admin(vicente,4321).


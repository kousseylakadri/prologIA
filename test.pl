:- dynamic linea/2.

linea(1,[pantitlan,
		zaragoza,
		gomez_farias,
		boulevard_puerto_aereo,
		balbuena,
		moctezuma,
		san_lazaro,
		candelaria,
		merced,
		pino_suarez,
		isabel_la_catolica,
		salto_del_agua,
		balderas,
		cuauhtemoc,
		insurgentes,
		sevilla,
		chapultepec,
		juanacatlan,
		tacubaya,
		observatorio]).


linea(2,[cuatro_caminos,
		panteones,
		tacuba,
		cuitlahuac,
		popotla,
		colegio_militar,
		normal,
		san_cosme,
		revolucion,
		hidalgo,
		bellas_artes,
		allende,
		zocalo,
		pino_suarez,
		san_antonio_abad,
		chabacano,
		viaducto,
		xola,
		villa_de_cortes,
		nativitas,
		portales,
		ermita,
		general_anaya,
		tasquena]).

linea(3,[indios_verdes,
		deportivo_18_de_marzo,
		potrero,
		la_raza,
		tlatelolco,
		guerrero,
		hidalgo,
		juarez,
		balderas,
		ninos_heroes,
		hospital_general,
		centro_medico,
		etiopia,
		eugenia,
		division_del_norte,
		zapata,
		coyoacan,
		viveros,
		miguel_angel_de_quevedo,
		copilco,
		universidad]).

linea(4,[martin_carrera,
		talisman,
		bondojito,
		consulado,
		canal_del_norte,
		morelos,
		candelaria,
		fray_servando,
		jamaica,
		santa_anita]).


linea(5,[pantitlan,
		hangares,
		terminal_aerea,
		oceania,
		aragon,
		eduardo_molina,
		consulado,
		valle_gomez,
		misterios,
		la_raza,
		autobuses_del_norte,
		instituto_del_petroleo,
		politecnico]).

linea(6,[el_rosario,
		tezozomoc,
		uam_azcapotzalco,
		ferreria_arena_cdmx,
		norte_45,
		vallejo,
		instituto_del_petroleo,
		lindavista,
		deportivo_18_de_marzo,
		la_villa_basilica,
		martin_carrera]).

linea(7,[el_rosario,
		aquiles_serdan,
		refineria,
		tacuba,
		san_joaquin,
		polanco,
		auditorio,
		constituyentes,
		tacubaya,
		san_pedro_de_los_pinos,
		san_antonio,
		mixcoac,
		barranca_del_muerto]).

linea(9,[pantitlan,
		puebla,
		iztacalco,
		ciudad_deportiva,
		velodromo,
		mixiuhca,
		jamaica,
		chabacano,
		lazaro_cardenas,
		centro_medico,
		chilpancingo,
		patriotismo,
		tacubaya]).

linea(8,[garibaldi,
		bellas_artes,
		san_juan_de_letran,
		salto_del_agua,
		doctores,
		obrera,
		chabacano,
		la_viga,
		santa_anita,
		coyuya,
		iztacalco,
		apatlaco,
		aculco,
		escuadron_201,
		atlalilco,
		iztapalapa,
		cerro_de_la_estrella,
		uam_i,
		constitucion_de_1917]).

linea(a,[pantitlan,
		agricola_oriental,
		canal_de_san_juan,
		tepalcates,
		guelatao,
		penon_viejo,
		acatitla,
		santa_marta,
		los_reyes,
		la_paz]).

linea(b,[buenavista,
		guerrero,
		garibaldi,
		lagunilla,
		tepito,
		morelos,
		san_lazaro,
		ricardo_flores_magon,
		romero_rubio,
		oceania_gustavo_a_madero,
		deportivo_oceania,
		bosque_de_aragon,
		villa_de_aragon,
		nezahualcoyot,
		impulsora,
		rio_de_los_remedios,
		muzquiz_ecatepec_de_morelos,
		ecatepec,
		olimpica,
		plaza_aragon,
		ciudad_azteca]).

linea(12,[tlahuac,
		tlaltenco,
		zapotitlan,
		nopalera,
		olivos,
		tezonco,
		periferico_oriente,
		calle_11,
		lomas_estrella,
		san_andres_tomatlan,
		culhuacan,
		atlalilco,
		mexicaltzingo,
		ermita,
		eje_central,
		parque_de_los_venados,
		zapata,
		hospital_20_de_noviembre,
		insurgentes_sur,
		mixcoac]).

% Funciones

size_of([],0). 
   size_of([_|T],N)  :-  size_of(T,X),  N  is  X+1.

encuentraRuta(X,Y):-encuentraRuta(X,Y,[],[]).

encuentraRuta(X,Y,Lineas,Salida):-linea(Linea,Estaciones), %% trae todas las listas de Estaciones de todas la lineas
							\+ member(Linea,Lineas), %% Verifica que Linea no haya sido ya visitada
							member(X,Estaciones), %% verifica que el origen este en alguna de las listas de Estaciones
							member(Y,Estaciones), %% verifica que el destino este en alguna de las listas de Estaciones
							append(Salida,[[X,Linea,Y]],NuevaSalida), %% agrega a la lista Salida una lista que contiene el origen, la linea visitada, el destino; y las mete a la lista NuevaSalida
							size_of(NuevaSalida,Size),
    						write(Size),
    						nl,
    						agregarResultado(NuevaSalida,Total,NuevaSalida),
    						write(Total),
    						imprimeTotal(NuevaSalida).
%    						imprime(NuevaSalida). %% Imprime todos los pasos que se siguieron para llegar de origen a destino

encuentraRuta(X,Y,Lineas,Salida):-linea(Linea,Estaciones), %% Trae Linea por Linea con una Lista de sus Estaciones
							\+ member(Linea,Lineas), %% Verifica que Linea NO este dentro de las Lineas Visitadas
							member(X,Estaciones), %% Verifica si la estacion de origen esta en la lista de Estaciones de la linea
							member(Transbordo,Estaciones), %% En busqueda de Transbordo, verifica si la estacion se encuentra en otra linea
							X\=Transbordo,Transbordo\=Y, %% Descarta que Transbordo sea la estacion de origen
							append(Salida,[[X,Linea,Transbordo]],NuevaSalida), %% Concatena en NuevaSalida, los parametros a imprimir que representan los pasos a seguir en cada linea.
							encuentraRuta(Transbordo,Y,[Linea|Lineas],NuevaSalida).

estaciones(Numero):-linea(Numero,Estaciones), %% trae la lista de estaciones que cumplen con la condición numero 
					format('La linea ~w, tiene las estaciones: ~w',[Numero,Estaciones]).

extremos(Linea):-linea(Linea,Estaciones), %% guarda la lista de estaciones que cumplen con la linea dada
				[Head|_] = Estaciones,	 %% toma la cabeza de la lista Estaciones
				reverse(Estaciones,InvEst), %%  Invierte la lista estaciones y la guarda en InvEst
				[InvHead|_] = InvEst, %% toma la cabeza de la lista estaciones que era el ultimo elemento de Estaciones
				format('La linea ~w, tiene como terminales a: ~w <--> ~w',[Linea,Head,InvHead]).

min([Item], Item).
min([Item | List], Item) :- 
	min(List, List_Answer),
	Item =< List_Answer, !.
min([_Item | List], Answer) :-
	min(List, Answer).

agregarResultado(NuevaSalida,Total,N) :- append(Total,NuevaSalida,N).

imprime([]).
imprime([H|T]):-format('De la estacion ~w toma la linea ~w hacia ~w\n', H),imprime(T).

imprimeTotal([]).
imprimeTotal([H | T]) :- imprimeTotal(T),imprime(H).
							

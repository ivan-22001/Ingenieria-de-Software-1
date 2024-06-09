!classDefinition: #PenalesTest category: #'ISW1-2023-2C-Parcial-1'!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'I 4/27/2024 16:03:42'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:39:22'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Arquero
	instanceVariableNames: 'fuerzaBase estrategia puntaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Arquero methodsFor: 'initialization' stamp: 'I 4/27/2024 18:40:34'!
initializeWithEstrategia: estrategiaARealizar withFuerzaBase: fuerzaParaAtajar.
	fuerzaBase := fuerzaParaAtajar.
	estrategia := estrategiaARealizar.
	puntaje := 0! !


!Arquero methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 13:17:00'!
estrategia
	^estrategia! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 13:16:17'!
estrategiaAUsar
	^estrategia! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 13:16:00'!
fuerza
	^fuerzaBase! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:00:06'!
mismaDireccionConFuerza: fuerzaPateada delDelantero: delantero
paraPenal: penalADecidir
(fuerzaPateada>fuerzaBase)ifTrue:[penalADecidir ganaDelantero]ifFalse:[penalADecidir ganaArquero]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #'ISW1-2023-2C-Parcial-1'!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:33:13'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: fuerzaParaAtajar
	^ArqueroElige new withFuerzaBase: fuerzaParaAtajar.! !

!Arquero class methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:33:25'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: fuerzaParaAtajar
	^ArqueroEspera new withFuerzaBase: fuerzaParaAtajar.! !


!classDefinition: #ArqueroElige category: #'ISW1-2023-2C-Parcial-1'!
Arquero subclass: #ArqueroElige
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!ArqueroElige methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:57:27'!
defiendeConFuerza: fuerzaAtajada delDelantero: fuerzaLanzada paraPenal: penalADecidir

(fuerzaLanzada>fuerzaAtajada)ifTrue:[penalADecidir ganaDelantero]ifFalse:[penalADecidir ganaArquero].
! !

!ArqueroElige methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:51:39'!
defiendeJabulaniAColocarEnDireccion: direccionArquero delPenal: penalADecidir
	fuerzaBase := fuerzaBase + (fuerzaBase /2).
	penalADecidir esAtajadoConFuerza: fuerzaBase.

(penalADecidir varDireccionRemateResultante x = direccionArquero x ) ifTrue:[self defiendeConFuerza: penalADecidir  varFuerzaResultanteDeAtajada delDelantero: penalADecidir varFuerzaResultanteDeTiro paraPenal: penalADecidir] ifFalse:[penalADecidir ganaDelantero ]! !

!ArqueroElige methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:46:39'!
defiendeJabulaniAMatarEnDireccion: direccionArquero  delPenal: penalADecidir
	fuerzaBase := fuerzaBase .
	penalADecidir esAtajadoConFuerza: fuerzaBase.

(penalADecidir varDireccionRemateResultante x = direccionArquero x ) ifTrue:[self defiendeConFuerza: penalADecidir  varFuerzaResultanteDeAtajada delDelantero: penalADecidir varFuerzaResultanteDeTiro paraPenal: penalADecidir] ifFalse:[penalADecidir ganaDelantero ]! !

!ArqueroElige methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:05:24'!
defiendePlayeraAColocarEnDireccion: direccionArquero  delPenal: penalADecidir
	fuerzaBase := fuerzaBase *2 .
	penalADecidir esAtajadoConFuerza: fuerzaBase.

(penalADecidir varDireccionRemateResultante x = direccionArquero x ) ifTrue:[self defiendeConFuerza: penalADecidir  varFuerzaResultanteDeAtajada delDelantero: penalADecidir varFuerzaResultanteDeTiro paraPenal: penalADecidir] ifFalse:[penalADecidir ganaDelantero ]! !

!ArqueroElige methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 21:31:18'!
defiendePlayeraAMatarEnDireccion: direccionArquero  delPenal: penalADecidir
	fuerzaBase := fuerzaBase *2 .
	penalADecidir esAtajadoConFuerza: fuerzaBase.

((penalADecidir direccionValidaParaTiro: penalADecidir varDireccionRemateResultante )) ifTrue:[(penalADecidir varDireccionRemateResultante y = direccionArquero y)  ifTrue:[self defiendeConFuerza: penalADecidir  varFuerzaResultanteDeAtajada delDelantero: penalADecidir varFuerzaResultanteDeTiro paraPenal: penalADecidir]ifFalse:[penalADecidir ganaDelantero]] ifFalse:[penalADecidir ganaArquero ]! !

!ArqueroElige methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:41:13'!
withFuerzaBase: fuerzaParaAtajar.
	fuerzaBase:= fuerzaParaAtajar.
	puntaje := 0.! !


!classDefinition: #ArqueroEspera category: #'ISW1-2023-2C-Parcial-1'!
Arquero subclass: #ArqueroEspera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!ArqueroEspera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:41:08'!
defiendeConFuerza: fuerzaAtajada delDelantero: fuerzaLanzada paraPenal: penalADecidir

(fuerzaLanzada>fuerzaAtajada)ifTrue:[penalADecidir ganaDelantero]ifFalse:[penalADecidir ganaArquero].
! !

!ArqueroEspera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:12:24'!
defiendeJabulaniAColocarEnDireccion: direccionArquero  
delPenal: penalADecidir 

	fuerzaBase := fuerzaBase .
	penalADecidir esAtajadoConFuerza: fuerzaBase.
(penalADecidir varDireccionRemateResultante x = direccionArquero x ) ifTrue:[self defiendeConFuerza: penalADecidir  varFuerzaResultanteDeAtajada delDelantero: penalADecidir varFuerzaResultanteDeTiro paraPenal: penalADecidir] ifFalse:[penalADecidir ganaDelantero ]! !

!ArqueroEspera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:48:55'!
defiendeJabulaniAMatarEnDireccion: direccionArquero  delPenal: penalADecidir
	penalADecidir ganaDelantero.! !

!ArqueroEspera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:06:30'!
defiendePlayeraAColocarEnDireccion: direccionArquero  delPenal: penalADecidir
	
	penalADecidir ganaDelantero.
! !

!ArqueroEspera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 21:14:22'!
defiendePlayeraAMatarEnDireccion: direccionArquero  delPenal: penalADecidir
	
	penalADecidir ganaArquero.
! !

!ArqueroEspera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:41:17'!
withFuerzaBase: fuerzaParaAtajar.
	fuerzaBase:= fuerzaParaAtajar.
	puntaje := 0.! !


!classDefinition: #Delantero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Delantero
	instanceVariableNames: 'fuerzaBase direccionRematada puntaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Delantero methodsFor: 'initialization' stamp: 'I 4/27/2024 12:50:04'!
initializeEstrategiaTiro: estrategiaATirar         			withFuerzaBase:cantidadDeFuerzaALanzar
	fuerzaBase := cantidadDeFuerzaALanzar.
	estrategia := estrategiaATirar.! !


!Delantero methodsFor: 'values' stamp: 'I 4/27/2024 13:16:51'!
estrategia
	^estrategia! !

!Delantero methodsFor: 'values' stamp: 'I 4/27/2024 13:08:54'!
estrategiaARealizar
	^estrategia! !

!Delantero methodsFor: 'values' stamp: 'I 4/27/2024 13:09:12'!
fuerzaATirar
	^fuerzaBase! !


!Delantero methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:42:09'!
puntaje
	^ puntaje! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #'ISW1-2023-2C-Parcial-1'!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:14:21'!
decideTirarAColocarSuFuerzaBaseEs: cantidadDeFuerzaALanzar
	^DelanteroTiraAColocar new           			withFuerzaBase:cantidadDeFuerzaALanzar! !

!Delantero class methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:20:02'!
decideTirarAMatarSuFuerzaBaseEs: cantidadDeFuerzaALanzar
	^DelanteroTiraAMatar new        			withFuerzaBase:cantidadDeFuerzaALanzar! !


!classDefinition: #DelanteroTiraAColocar category: #'ISW1-2023-2C-Parcial-1'!
Delantero subclass: #DelanteroTiraAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!DelanteroTiraAColocar methodsFor: 'initialization' stamp: 'I 4/27/2024 18:15:10'!
withFuerzaBase:cantidadDeFuerzaALanzar
	fuerzaBase := cantidadDeFuerzaALanzar/2! !


!DelanteroTiraAColocar methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 21:05:49'!
tiralAlArcoConDireccion: direccionTiro conPelota: pelota conArquero: arquero arqueroDefendiendoDireccion: direccionArquero delPenal: penalADecidir

	penalADecidir esLanzadoADireccion: (pelota esLanzadaAColocarConDireccion: direccionTiro).
	fuerzaBase := pelota esPateadaConFuerzaAColocar: fuerzaBase.
	
	penalADecidir esLanzadoConFuerza: fuerzaBase.
	pelota esTiradaAColocarAlArquero: arquero defendiendoLaDireccion: direccionArquero delPenal: penalADecidir.
	! !


!classDefinition: #DelanteroTiraAMatar category: #'ISW1-2023-2C-Parcial-1'!
Delantero subclass: #DelanteroTiraAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!DelanteroTiraAMatar methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 21:10:33'!
tiralAlArcoConDireccion: direccionTiro conPelota: pelota conArquero: arquero arqueroDefendiendoDireccion: direccionArquero delPenal: penalADecidir

	pelota esLanzadaAMatarConDireccion: direccionTiro enPenal: penalADecidir.
	fuerzaBase := pelota esPateadaConFuerzaAMatar: fuerzaBase .
	penalADecidir esLanzadoConFuerza: fuerzaBase.
	pelota esTiradaAMatarAlArquero: arquero defendiendoLaDireccion: direccionArquero delPenal: penalADecidir.
	! !

!DelanteroTiraAMatar methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:15:44'!
withFuerzaBase:cantidadDeFuerzaALanzar
	fuerzaBase := cantidadDeFuerzaALanzar! !


!classDefinition: #Pelota category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Pelota
	instanceVariableNames: 'pelota'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Pelota methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 12:52:17'!
initializeWithPelota: pelotaAUsar
	pelota := pelotaAUsar.
	! !

!Pelota methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 13:09:37'!
pelotaUsada
	^pelota! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #'ISW1-2023-2C-Parcial-1'!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:26:47'!
jabulaniSudafricanaRapida
	^Jabulani new ! !

!Pelota class methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:26:57'!
playeraLentaCostaAzul.
	^Playera new ! !


!classDefinition: #Jabulani category: #'ISW1-2023-2C-Parcial-1'!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Jabulani methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:28:27'!
esLanzadaAColocarConDireccion: direccionTiro
	^direccionTiro! !

!Jabulani methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:44:58'!
esLanzadaAMatarConDireccion: direccionTiro enPenal: penalADecidir
	(penalADecidir esAngulo: direccionTiro) ifTrue:[(direccionTiro y < 2)ifTrue:[penalADecidir esLanzadoADireccion:( direccionTiro x @ (direccionTiro y +1))]ifFalse:[penalADecidir esLanzadoADireccion: (direccionTiro x @ (direccionTiro y -1))]]ifFalse:[penalADecidir esLanzadoADireccion: direccionTiro ].! !

!Jabulani methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:29:29'!
esPateadaConFuerzaAColocar: fuerzaLlegada
	^fuerzaLlegada! !

!Jabulani methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:24:40'!
esPateadaConFuerzaAMatar: fuerzaLlegada
	^fuerzaLlegada + ((fuerzaLlegada * 20)/100)! !

!Jabulani methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:47:55'!
esTiradaAColocarAlArquero: arquero defendiendoLaDireccion: direccionArquero delPenal: penalADecidir
	arquero 	defiendeJabulaniAColocarEnDireccion: direccionArquero  delPenal: penalADecidir! !

!Jabulani methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:45:54'!
esTiradaAMatarAlArquero: arquero defendiendoLaDireccion: direccionArquero delPenal: penalADecidir
	arquero 	defiendeJabulaniAMatarEnDireccion: direccionArquero  delPenal: penalADecidir! !


!classDefinition: #Playera category: #'ISW1-2023-2C-Parcial-1'!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Playera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:01:32'!
esLanzadaAColocarConDireccion: direccionTiro
	^direccionTiro! !

!Playera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:57:52'!
esLanzadaAMatarConDireccion: direccionTiro enPenal: penalADecidir
	(penalADecidir esAngulo: direccionTiro )ifFalse: [penalADecidir esLanzadoADireccion: direccionTiro x @ (direccionTiro y +2)] ifTrue: [(direccionTiro y < 2)ifTrue:[penalADecidir esLanzadoADireccion: direccionTiro x @ (direccionTiro y +1)]ifFalse:[penalADecidir esLanzadoADireccion: direccionTiro x @ (direccionTiro y -1)]] .! !

!Playera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:18:44'!
esPateadaConFuerzaAColocar: fuerzaLlegada
	^fuerzaLlegada  - ((fuerzaLlegada  *20)/100)  ! !

!Playera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:58:53'!
esPateadaConFuerzaAMatar: fuerzaLlegada
	^fuerzaLlegada   ! !

!Playera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 20:01:47'!
esTiradaAColocarAlArquero: arquero defendiendoLaDireccion: direccionArquero delPenal: penalADecidir
	arquero 	defiendePlayeraAColocarEnDireccion: direccionArquero  delPenal: penalADecidir! !

!Playera methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 21:01:08'!
esTiradaAMatarAlArquero: arquero defendiendoLaDireccion: direccionArquero delPenal: penalADecidir
	arquero 	defiendePlayeraAMatarEnDireccion: direccionArquero  delPenal: penalADecidir! !


!classDefinition: #Penales category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Penales
	instanceVariableNames: 'delantero arquero puntajeDelantero puntajeArquero direccionRemate potenciaTiro fuerzaAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Penales methodsFor: 'ayuda diseñador del juego' stamp: 'I 4/27/2024 21:18:53'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionTiro arqueroSeLanzaEnDirección: direccionArquero

	"Hola de nuevo!!"
	"Bueno, yo soy sólo el diseñador del juego pero ojo que algo de programación sé, eh?"
	"Te tiro una mano... para mi esto sale más o menos así:"
	
	"[asserts, chequeos de errores, etc..].
	
	[inicialización de ''cosas'' que se modifican dependiendo de los ifs de abajo... Por ej la fuerza del jugador o del arquero iniciales pueden cambiar segun el escenario del test en cuestión]."
	
	
self direccionValidaParaTiro: direccionTiro direccionValidaArquero: direccionArquero. 
delantero tiralAlArcoConDireccion: direccionTiro conPelota: pelota conArquero: arquero arqueroDefendiendoDireccion: direccionArquero delPenal: self."
(delantero estrategia = #aColocar) ifTrue: [
    pelota pelotaUsada= #Jabulani ifTrue: [
	
	potenciaTiro := delantero fuerzaATirar / 2.
        arquero estrategia = #EligeDireccionAntesTiro ifTrue: [direccionTiro  = direccionArquero  ifTrue: [
		fuerzaAtajada := arquero fuerza +(arquero fuerza/2).
                (potenciaTiro) > ( fuerzaAtajada) ifTrue: [
                    puntajeDelantero := 1
                ] ifFalse:[puntajeArquero := 1]
            ]ifFalse: [
                    puntajeDelantero := 1
                ].
	
		].
        arquero estrategia = #EsperaTiroYSeAdelanta ifTrue: [
            direccionTiro x = direccionArquero  x ifTrue: [
		fuerzaAtajada := arquero fuerza.
                (potenciaTiro) > fuerzaAtajada ifTrue: [
                    puntajeDelantero := 1
                ] ifFalse:[puntajeArquero := 1]
            ]ifFalse: [
                    puntajeDelantero := 1
                ].
        ].
	direccionRemate := direccionTiro.
	
    ].
    pelota pelotaUsada = #Playera ifTrue: [
       
	potenciaTiro := delantero fuerzaATirar / 2 - (((delantero fuerzaATirar / 2)*20)/100) .
        arquero estrategia = #EligeDireccionAntesTiro ifTrue: [direccionTiro  = direccionArquero  ifTrue: [
		fuerzaAtajada := arquero fuerza +arquero fuerza.
                (potenciaTiro) > ( fuerzaAtajada) ifTrue: [
                    puntajeDelantero := 1
                ] ifFalse:[puntajeArquero := 1]
            ]ifFalse: [
                    puntajeDelantero := 1
                ].
	
		].
        arquero estrategia = #EsperaTiroYSeAdelanta ifTrue: [
	puntajeDelantero := 1.
        ].
	direccionRemate := direccionTiro.
    ]
].
(delantero estrategia = #aMatar) ifTrue: [
    pelota pelotaUsada= #Jabulani ifTrue: [
	
	potenciaTiro := delantero fuerzaATirar +  ((delantero fuerzaATirar*20)/100).
	
        arquero estrategia = #EligeDireccionAntesTiro ifTrue: [
	(self esAngulo: direccionTiro)ifTrue:[(direccionTiro y < 2)ifTrue:[direccionRemate := direccionTiro x @ (direccionTiro y +1)]ifFalse:[direccionRemate := direccionTiro x @ (direccionTiro y -1)]]ifFalse:[direccionRemate := direccionTiro ].
	direccionRemate  x = direccionArquero x  ifTrue: [
		fuerzaAtajada := arquero fuerza .
                (potenciaTiro) > ( fuerzaAtajada) ifTrue: [
                    puntajeDelantero := 1
                ] ifFalse:[puntajeArquero := 1]
            ]ifFalse: [
                    puntajeDelantero := 1.
		   
                ].
	
		].
        arquero estrategia = #EsperaTiroYSeAdelanta ifTrue: [
                    puntajeDelantero := 1.
		   direccionRemate:= direccionTiro.
        ].
    ].
    pelota pelotaUsada = #Playera ifTrue: [
       
	potenciaTiro := delantero fuerzaATirar .
	(self esAngulo: direccionTiro )ifFalse: [direccionRemate := direccionTiro x @ (direccionTiro y +2)] ifTrue: [(direccionTiro y < 2)ifTrue:[direccionRemate := direccionTiro x @ (direccionTiro y +1)]ifFalse:[direccionRemate := direccionTiro x @ (direccionTiro y -1)]] .
	(direccionRemate y > 2 ) ifTrue: [puntajeArquero:=1] ifFalse:[
        arquero estrategia = #EligeDireccionAntesTiro ifTrue: [direccionRemate y = direccionArquero y ifTrue: [
		fuerzaAtajada := arquero fuerza +arquero fuerza.
                (potenciaTiro) > ( fuerzaAtajada) ifTrue: [
                    puntajeDelantero := 1
                ] ifFalse:[puntajeArquero := 1]
            ]ifFalse: [
                    puntajeDelantero := 1
                ].
	
		].].
        arquero estrategia = #EsperaTiroYSeAdelanta ifTrue: [
	puntajeArquero := 1.
        ].
    ]
].
	xxx = #AColocar ifTrue:[
		[Lo que sea que aplica sólo para estos tiros, si algo...],
		yyy = #Jabulani ifTrue: [
			[lo que sea que aplique para estos tiros y la pelota, si algo...]
			zzz  = #EligeDireccionAntesTiro ifTrue:
				[Caso específico de los tres al mismo tiempo...].
			zzz = #EsperaTiroYSeAdelanta ifTrue: 
				[...].
		].
		yyy = #Playera ifTrue:[
			[...].
			zzz  = #EligeDireccionAntesTiro ifTrue:
				[...].
			zzz = #EsperaTiroYSeAdelanta ifTrue:
				[...].
		].
	].
	xxx = #AMatar ifTrue:[
		[...].
		yyy = #Jabulani ifTrue: [
			[...].
			zzz = #EligeDireccionAntesTiro ifTrue:
				[...].
			zzz = #EsperaTiroYSeAdelanta ifTrue:
				[...].
		].
		yyy = #Playera ifTrue:[
			[...].
			zzz  = #EligeDireccionAntesTiro ifTrue:
				[...].
			zzz= #EsperaTiroYSeAdelanta ifTrue:
				[...].
		].
	].
	
	[Se decide quién ganó en base a como quedaron las ''cosas'' después de los ifs...]
	
	o sea, el caso general sería algo como lo que sigue, no?
	
	[trayectoraFinalTiro between: 0@0 and 2@2] ifFalse:
		[puntajeArquero := 1] ifTrue:
			Esta parte que sigue no me salió...  ayudame vos a mi ;) mi idea es:
			[algo que chequee si las coordenadas finales de ambos quedaron iguales despues de los ifs?]
			[y que la fuerza del arquero final es mayor o igual a la del tiro?] ifTrue:
				[puntajeArquero := 1] ifFalse:
				[puntajeDelantero := 1]."
	
	
	"Bueno, algo así..."
	"jajaj, sí, ya sé, vos seguro lo podes hacer mucho mejor... pero nada, es gratis y lo tenés de referencia si lo queres usar. Por ahí te sirve... ;)"! !


!Penales methodsFor: 'initialization' stamp: 'I 4/27/2024 14:42:19'!
initializeWithDelantero: delanteroAPatear withArquero: arqueroAAtajar.
	delantero := delanteroAPatear.
	arquero := arqueroAAtajar.
	puntajeDelantero := 0.
	puntajeArquero := 0.! !


!Penales methodsFor: 'value' stamp: 'I 4/27/2024 14:43:22'!
puntajeDeArquero
	^puntajeArquero! !

!Penales methodsFor: 'value' stamp: 'I 4/27/2024 14:43:10'!
puntajeDeDelantero
	^puntajeDelantero! !

!Penales methodsFor: 'value' stamp: 'I 4/27/2024 14:58:00'!
varDireccionRemateResultante
	^direccionRemate! !

!Penales methodsFor: 'value' stamp: 'I 4/27/2024 15:35:44'!
varFuerzaResultanteDeAtajada
	^fuerzaAtajada! !

!Penales methodsFor: 'value' stamp: 'I 4/27/2024 15:10:50'!
varFuerzaResultanteDeTiro
	^potenciaTiro! !


!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 21:21:43'!
direccionValidaParaTiro: direccionTiro 
 	^((direccionTiro x between: 0 and: 2) and: [direccionTiro y between: 0 and: 2])! !

!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:00:37'!
direccionValidaParaTiro: direccionTiro direccionValidaArquero: direccionArquero
 	((direccionTiro x between: 0 and: 2) and: [direccionTiro y between: 0 and: 2]) ifFalse: [
    self error: Penales direccionTiroFueraDeRango
].
((direccionArquero x between: 0 and: 2) and: [direccionArquero y between: 0 and: 2]) ifFalse: [
    self error: Penales direccionArqueroFueraDeRango.
].! !

!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 17:14:43'!
esAngulo: direccionTiro
 	^(direccionTiro x = 0 and: [direccionTiro y = 0] ) or: 
	(direccionTiro x = 0 and: [direccionTiro y = 2] ) or: 
	(direccionTiro x = 2 and: [direccionTiro y = 0] ) or: 
	(direccionTiro x = 2 and: [direccionTiro y = 2] )! !

!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:42:27'!
esAtajadoConFuerza: fuerzaBase
	fuerzaAtajada := fuerzaBase.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:04:15'!
esLanzadoADireccion: direccionTiro
	direccionRemate := direccionTiro.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 19:42:05'!
esLanzadoConFuerza: fuerzaBase
	potenciaTiro := fuerzaBase.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:56:24'!
ganaArquero
	puntajeArquero:= 1.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 18:58:20'!
ganaDelantero
	puntajeDelantero:= 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #'ISW1-2023-2C-Parcial-1'!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'as yet unclassified' stamp: 'I 4/27/2024 13:04:17'!
conDelantero: delanteroAPatear yArquero: arqueroAAtajar
	^self new initializeWithDelantero: delanteroAPatear withArquero: arqueroAAtajar.! !

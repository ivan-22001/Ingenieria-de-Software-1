!classDefinition: #CrewTest category: #'ISW1-2022-2C-1erParcial'!
TestCase subclass: #CrewTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:37:37'!
test01MovingCrewToTreePlaceDoesNotMove

	| island crew crewPosition treePosition map |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.
			
	crew moveTo: treePosition.
	
	self deny: (island hasCrewAt: treePosition).
	self assert: (island hasCrewAt: crewPosition).! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:37:46'!
test02MovingCrewToTreePlaceFilibusteroRemovesTree

	| island crew treePosition crewPosition map |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	self deny: (island isEmptyAt: treePosition).
				
	crew moveTo: treePosition.

	self assert: (island isEmptyAt: treePosition).
	
	self deny: (island hasCrewAt: treePosition).
	self assert: (island hasCrewAt: crewPosition).! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:37:55'!
test03MovingCrewToFreePlace

	| island crew treePosition crewPosition nextPosition map |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	nextPosition := 2@1.
	self assert: (island isEmptyAt: nextPosition).
	
	crew moveTo: nextPosition.

	self deny: (island hasCrewAt: crewPosition).
	self assert: (island hasCrewAt: nextPosition).! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:38:05'!
test04MovingCrewToFreePlaceCorsarioWritesDirectionInMap

	| island crew treePosition crewPosition nextPosition map |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	nextPosition := 2@1.
	self assert: map isEmpty.

	crew moveTo: nextPosition.

	self assert: map stepsSize equals: 1. 
	self assert: map lastPosition equals: nextPosition.
! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:38:15'!
test05CrewCannotBuryTreasureIfBucaneroCannotDig

	| island crew treePosition crewPosition map digPosition |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	digPosition := 2@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	
	self 
		should: [ crew buryTreasureAt: 3@1 ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | 
			self assert: error messageText equals: Bucanero cannotDigErrorDescription.
			self deny: map hasTreasureMark ]
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:38:25'!
test06CrewCanBuryTreasureIfBucaneroCanDig

	| island crew treePosition crewPosition map digPosition |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	digPosition := 2@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	crew buryTreasureAt: 2@2.
	
	self assert: map hasTreasureMark.
	
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:38:34'!
test07CaptainCanUseMap

	| island crew treePosition crewPosition map digPosition pirate |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	digPosition := 2@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	crew buryTreasureAt: 2@2.

	pirate := Bucanero new.
	pirate aCaptainIWasMeantToBe.
	
	self assert: (pirate searchTreasureIn: island with: map)! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/22/2022 16:38:42'!
test08SimplePirateCannotUseMap

	| island crew treePosition crewPosition map digPosition pirate |
	
	crewPosition := 1@1.
	treePosition := 1@2.
	digPosition := 2@2.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	crew buryTreasureAt: 2@2.

	pirate := Bucanero new.
	
	self 
		should: [ pirate searchTreasureIn: island with: map ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: 'I am a simple pirate!!'
! !


!classDefinition: #Crew category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Crew
	instanceVariableNames: 'island pirates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Crew methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 14:18:18'!
buryTreasureAt: aPosition

	| terrain |
	
	terrain := island terrainAt: aPosition.
	pirates do: [ :pirate | pirate canBurySecretAt: aPosition in: terrain at: island ]."
	index := 1.
	[index <= pirates size] whileTrue: [ | pirate |
		pirate := pirates at: index.
		pirate canBurySecretAt: aPosition in: terrain at:island.
		index := index + 1.
	].22"
	! !

!Crew methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 22:53:00'!
initializeWith: anIsland pirates: aPirates at: aPosition

	island := anIsland.
	pirates := aPirates.
	
	island crewAt: aPosition.! !

!Crew methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:52:57'!
moveTo: aPosition

	| moved terrain |
	
	terrain := island terrainAt: aPosition.
	
	moved := pirates inject: true into: [ :canMove :pirate | canMove & (pirate canMoveTo: aPosition in: terrain at: island )	].
		
	"nos movemos si todos pueden moverse"
	moved ifTrue: [ island crewAt: aPosition ].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Crew class' category: #'ISW1-2022-2C-1erParcial'!
Crew class
	instanceVariableNames: ''!

!Crew class methodsFor: 'as yet unclassified' stamp: 'HAW 9/18/2022 19:21:29'!
at: anIsland composedBy: aCrew at: aPosition

	^ self new initializeWith: anIsland pirates: aCrew at: aPosition ! !


!classDefinition: #Island category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Island
	instanceVariableNames: 'boardSize treesAt digsAt crewAt treasureAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:34:06'!
clearTerrainAt: aPosition

	| ix |
	
	ix := 1.
	[ix <= treesAt size] whileTrue: [ | pos |
		pos := treesAt at: ix.
		(aPosition = pos) ifTrue: [ ^ treesAt removeIndex: ix ].
		
		ix := ix + 1.
	].
	
! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:37:10'!
crewAt: aPosition

	crewAt := aPosition.! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:45:56'!
hasCrewAt: aPosition

	^ crewAt = aPosition.! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:23:00'!
initializeSized: size treesAt: treesPositions digsAt: digsPositions

	boardSize := size.
	treesAt := treesPositions.
	digsAt := digsPositions.
! !

!Island methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:33:47'!
isEmptyAt: aPosition

	self searchInColection: treesAt ifSatisfyThePosition: aPosition withClosureValue: [^false].

	^ true! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:27:44'!
receiveTreasureAt: aPosition

	treasureAt := aPosition.! !

!Island methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:26:53'!
searchInColection: aCollectionToSearch ifSatisfyThePosition: aPosition withClosureValue: aBlockToValue
	| index |
	index := 1.
	[index <= aCollectionToSearch size] whileTrue:[|pos|
		pos := aCollectionToSearch at: index.
		(pos = aPosition) ifTrue: aBlockToValue.
		index := index + 1.
	].! !

!Island methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:34:02'!
terrainAt: aPosition


	self searchInColection: treesAt ifSatisfyThePosition: aPosition withClosureValue: [^Tree new].
	
	self searchInColection: digsAt ifSatisfyThePosition: aPosition withClosureValue: [^Diggable new].

	^Empty new.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Island class' category: #'ISW1-2022-2C-1erParcial'!
Island class
	instanceVariableNames: ''!

!Island class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:46:50'!
sized: size treesAt: treesPositions digsAt: digsPositions

	^ self new initializeSized: size treesAt: treesPositions digsAt: digsPositions 
! !


!classDefinition: #Map category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Map
	instanceVariableNames: 'island startPosition steps treasureMarkPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 19:00:56'!
hasTreasureMark

	^ treasureMarkPosition isNil not.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:30:31'!
initializeWith: anIsland crewStartsAt: aPosition

	island := anIsland.
	startPosition := aPosition.
	steps := OrderedCollection new.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:43:52'!
isEmpty

	^ steps isEmpty
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:45:55'!
lastPosition

	| acc ix |
	
	acc := startPosition.
	ix := 1.
	
	[ix <= steps size] whileTrue: [
		acc := acc + (steps at: ix)	.
		ix := ix + 1.
	].

	^ acc
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:39:01'!
nextStep: step

	^ steps add: step.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:33:43'!
startPosition

	^ startPosition
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:32:59'!
step: ix

	^ steps at: ix.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:32:23'!
stepsSize

	^ steps size.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 19:01:06'!
treasureMarkAt: aPosition

	treasureMarkPosition := aPosition.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Map class' category: #'ISW1-2022-2C-1erParcial'!
Map class
	instanceVariableNames: ''!

!Map class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:28:38'!
of: island crewStartsAt: aPosition.

	^ self new initializeWith: island crewStartsAt: aPosition.! !


!classDefinition: #Pirate category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Pirate
	instanceVariableNames: 'rank'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Pirate methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:39:59'!
aCaptainIWasMeantToBe

	rank := Captain new! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:40:07'!
buryTreasureTo: aPosition in: terrain at: island 
	
	self subclassResponsibility! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:40:16'!
canMoveTo: aPosition in: terrain at: island 
	
	self subclassResponsibility! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:39:51'!
initialize

	rank := SimplePirate new! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:40:27'!
searchTreasureIn: island with: aMap

	^rank searchTreasureFor: self at: island with: aMap! !


!classDefinition: #Bucanero category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Bucanero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Bucanero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 13:49:45'!
aCaptainIWasMeantToBe

	rank := Captain new.! !

!Bucanero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:42:21'!
canBurySecretAt: aPosition in: terrain at:island
	^terrain canBuryByBucanero: self inIsland: island inLocation: aPosition! !

!Bucanero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:12:41'!
canMoveTo: aPosition in: terrain at: island
	^terrain isRemoveByBucanero: self inIsland: island inLocation: aPosition! !

!Bucanero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 13:49:56'!
initialize

	rank := SimplePirate new.! !

!Bucanero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:51:11'!
searchTreasureIn: island with: aMap
	^rank searchTreasureIn: island with: aMap. 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bucanero class' category: #'ISW1-2022-2C-1erParcial'!
Bucanero class
	instanceVariableNames: ''!

!Bucanero class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 17:12:39'!
cannotDigErrorDescription

	^ 'Arrgh!! I cannot dig this type of terrain!!'.! !


!classDefinition: #Corsario category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Corsario
	instanceVariableNames: 'map'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Corsario methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 13:51:32'!
aCaptainIWasMeantToBe

	rank := Captain new! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:42:52'!
canBurySecretAt: aPosition in: terrain at:island
	^terrain canBuryByCorsario: self inIsland: island inLocation: aPosition! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:13:29'!
canMoveTo: aPosition in: terrain at: island
	^terrain isRemoveByCorsario: self inIsland: island inLocation: aPosition

	! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 22:43:57'!
drawDirectionTo: aPosition

	map nextStep: aPosition - (map lastPosition).
	
! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 19:01:22'!
drawTreasureMarkAt: aPosition

	map nextStep: aPosition - map lastPosition.
	map treasureMarkAt: aPosition.
	
! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 19:04:09'!
initialize

	rank := #NoRank! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 13:51:46'!
initializeWith: aMap

	rank := SimplePirate new.
	map := aMap! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:51:47'!
searchTreasureIn: island with: aMap

	^rank searchTreasureIn: island with: aMap. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Corsario class' category: #'ISW1-2022-2C-1erParcial'!
Corsario class
	instanceVariableNames: ''!

!Corsario class methodsFor: 'as yet unclassified' stamp: 'FRT 9/15/2022 21:46:08'!
with: aMap

	^ self new initializeWith: aMap.! !


!classDefinition: #Filibustero category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Filibustero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Filibustero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 13:52:03'!
aCaptainIWasMeantToBe

	rank := Captain new! !

!Filibustero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:43:08'!
canBurySecretAt: aPosition in: terrain at:island
	^terrain canBuryByFilibustero: self inIsland: island inLocation: aPosition! !

!Filibustero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:13:46'!
canMoveTo: aPosition in: terrain at: island
	^terrain isRemoveByFilibustero: self inIsland: island inLocation: aPosition

	! !

!Filibustero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 13:52:09'!
initialize

	rank := SimplePirate new.! !

!Filibustero methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:51:52'!
searchTreasureIn: island with: aMap

	^rank searchTreasureIn: island with: aMap. 
	! !


!classDefinition: #PirateRank category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #PirateRank
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!PirateRank methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:41:31'!
searchTreasureFor: aPirate at: anIsland with: aMap 

	self subclassResponsibility
! !


!classDefinition: #Captain category: #'ISW1-2022-2C-1erParcial'!
PirateRank subclass: #Captain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Captain methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:41:41'!
searchTreasureFor: aPirate at: anIsland with: aMa
	^ true "Aye, Aye!! La implementación está fuera del scope del parcial." ! !

!Captain methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 15:15:34'!
searchTreasureIn: island with: aMap
	^ true "Aye, Aye!! La implementación está fuera del scope del parcial." ! !


!classDefinition: #SimplePirate category: #'ISW1-2022-2C-1erParcial'!
PirateRank subclass: #SimplePirate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!SimplePirate methodsFor: 'as yet unclassified' stamp: 'I 4/29/2024 11:41:45'!
searchTreasureFor: aPirate at: anIsland with: aMa
	self error: 'I am a simple pirate!!'.! !

!SimplePirate methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 15:15:53'!
searchTreasureIn: island with: aMap
	self error: 'I am a simple pirate!!'.! !


!classDefinition: #Terrain category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Terrain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Terrain methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:44:08'!
canBuryByBucanero: aBucanero inIsland: island inLocation: aPosition

	self subclassResponsibility! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:44:15'!
canBuryByCorsario: aCorsario inIsland: island inLocation: aPosition

	self subclassResponsibility! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:44:21'!
canBuryByFilibustero: aFilibustero inIsland: island inLocation: aPosition

	self subclassResponsibility! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 15:45:27'!
isRemoveByBucanero: aBucanero inIsland: island inLocation: aPosition
	^self subclassResponsibility.
	! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:09:22'!
isRemoveByCorsario: aCorsario inIsland: island inLocation: aPosition
	^self subclassResponsibility.
	! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:09:35'!
isRemoveByFilibustero: aFilibustero inIsland: island inLocation: aPosition
	^self subclassResponsibility.
	! !


!classDefinition: #Diggable category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Diggable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Diggable methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:46:11'!
canBuryByBucanero: aBucanero inIsland: island inLocation: aPosition
	island receiveTreasureAt: aPosition! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:46:44'!
canBuryByCorsario: aCorsario inIsland: island inLocation: aPosition
	aCorsario drawTreasureMarkAt: aPosition.! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:46:26'!
canBuryByFilibustero: aFilibustero inIsland: island inLocation: aPosition
	! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:08:06'!
isRemoveByBucanero: aBucanero inIsland: island inLocation: aPosition
	^true.! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:09:04'!
isRemoveByCorsario: aCorsario inIsland: island inLocation: aPosition
	^true.! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:08:47'!
isRemoveByFilibustero: aFilibustero inIsland: island inLocation: aPosition
	^true.! !


!classDefinition: #Empty category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Empty methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:45:35'!
canBuryByBucanero: aBucanero inIsland: island inLocation: aPosition
	self error: 'Arrgh!! I cannot dig this type of terrain!!'! !

!Empty methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:45:42'!
canBuryByCorsario: aCorsario inIsland: island inLocation: aPosition
! !

!Empty methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:45:46'!
canBuryByFilibustero: aFilibustero inIsland: island inLocation: aPosition
	! !

!Empty methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 15:50:09'!
isRemoveByBucanero: aBucanero inIsland: island inLocation: aPosition
	^true.! !

!Empty methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:07:52'!
isRemoveByCorsario: aCorsario inIsland: island inLocation: aPosition
	aCorsario drawDirectionTo: aPosition.
	^true.! !

!Empty methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:07:19'!
isRemoveByFilibustero: aFilibusteri inIsland: island inLocation: aPosition
	^true.! !


!classDefinition: #Tree category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Tree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Tree methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:44:59'!
canBuryByBucanero: aBucanero inIsland: island inLocation: aPosition
	self error: 'Arrgh!! I cannot dig this type of terrain!!'! !

!Tree methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:45:12'!
canBuryByCorsario: aCorsario inIsland: island inLocation: aPosition
	! !

!Tree methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 16:45:21'!
canBuryByFilibustero: aFilibustero inIsland: island inLocation: aPosition
	! !

!Tree methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 15:46:00'!
isRemoveByBucanero: aBucanero inIsland: island inLocation: aPosition
	^false! !

!Tree methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 15:48:41'!
isRemoveByCorsario: aCorsario inIsland: island inLocation: aPosition

	^false! !

!Tree methodsFor: 'as yet unclassified' stamp: 'I 4/28/2024 15:48:01'!
isRemoveByFilibustero: aFilibustero inIsland: island inLocation: aPosition
	island clearTerrainAt: aPosition.
	^false! !

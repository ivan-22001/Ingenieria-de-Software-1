!classDefinition: #MarsRoversTest category: #'Mars Rovers'!
TestCase subclass: #MarsRoversTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/9/2024 23:48:24'!
test08RoverPointingWestMoveBackward
	| rover startingPoint |
	startingPoint := Point
		x: 1
		y: 2.
	rover := MarsRovers
		locationAt: startingPoint
		pointingTo: 'O'
		inWorkingArea:
			(Point
				x: 4
				y: 4).
	rover moveBackward.
	self
		assert:
			(Point
				x: 2
				y: 2)
		equals: rover location.! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/13/2024 01:14:42'!
test10
	| rover starting |
	starting := Point
		x: 1
		y: 2.
	rover := MarsRovers
		locationAt: starting
		pointingTo: 'O'
		inWorkingArea:
			(Point
				x: 4
				y: 4).
	rover moveBackward.
	rover rotateToRight.
	rover moveForward.
	self
		assert: 'N'
		equals: rover cardinalLocation.
	self
		assert:
			(Point
				x: 2
				y: 3)
		equals: rover location.! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/13/2024 01:06:11'!
test11
	| rover startingPoint |
	startingPoint := Point
		x: 1
		y: 2.
	rover := MarsRovers
		locationAt: startingPoint
		pointingTo: 'O'
		inWorkingArea:
			(Point
				x: 4
				y: 4).
	rover doAction: 'brf'.
	self
		assert: 'O'
		equals: rover cardinalLocation.
	self
		assert:
			(Point
				x: 2
				y: 3)
		equals: rover location.! !

!MarsRoversTest methodsFor: 'tests'!
! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/10/2024 00:03:54'!
test13RoverOutOfRangeMovingForwardEast
	|startingLocation areaOfWork rover|
	startingLocation := Point x: 4 y:3.
	areaOfWork := Point x: 4 y: 3.
	rover := MarsRovers locationAt: startingLocation pointingTo: 'E' inWorkingArea: areaOfWork. 
	self 
		should: [rover moveForward]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Rover fuera de rango' ]! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/9/2024 23:46:58'!
test14RoverOutOfRangeMovingForwardSouth
	|startingLocation areaOfWork rover|
	startingLocation := Point x: 4 y:0.
	areaOfWork := Point x: 4 y: 3.
	rover := MarsRovers locationAt: startingLocation pointingTo: 'S' inWorkingArea: areaOfWork. 
	self 
		should: [rover moveForward]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Coordenadas negativas no son validas' ]! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/10/2024 00:00:39'!
test15RoverOutOfRangeMovingBackwardWest
	|startingLocation areaOfWork rover|
	startingLocation := Point x: 4 y:3.
	areaOfWork := Point x: 4 y: 3.
	rover := MarsRovers locationAt: startingLocation pointingTo: 'O' inWorkingArea: areaOfWork. 
	self 
		should: [rover moveBackward]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Rover fuera de rango' ]! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/10/2024 00:12:23'!
test16RoverOutOfRangeMovingBackwardEast
	|startingLocation areaOfWork rover|
	startingLocation := Point x: 0 y:3.
	areaOfWork := Point x: 4 y: 3.
	rover := MarsRovers locationAt: startingLocation pointingTo: 'E' inWorkingArea: areaOfWork. 
	self 
		should: [rover moveBackward]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Coordenadas negativas no son validas' ]! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/10/2024 00:16:34'!
test17RoverOutOfRangeMovingForwardWest
	|startingLocation areaOfWork rover|
	startingLocation := Point x: 0 y:2.
	areaOfWork := Point x: 4 y: 3.
	rover := MarsRovers locationAt: startingLocation pointingTo: 'O' inWorkingArea: areaOfWork. 
	self 
		should: [rover moveForward]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Coordenadas negativas no son validas' ]! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/10/2024 00:17:09'!
test18RoverOutOfRangeMovingBackwardNort
	|startingLocation areaOfWork rover|
	startingLocation := Point x: 3 y:0.
	areaOfWork := Point x: 4 y: 3.
	rover := MarsRovers locationAt: startingLocation pointingTo: 'N' inWorkingArea: areaOfWork. 
	self 
		should: [rover moveBackward]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Coordenadas negativas no son validas' ]! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/10/2024 00:17:58'!
test19RoverOutOfRangeMovingBackwardSouth
	|startingLocation areaOfWork rover|
	startingLocation := Point x: 3 y:3.
	areaOfWork := Point x: 4 y: 3.
	rover := MarsRovers locationAt: startingLocation pointingTo: 'S' inWorkingArea: areaOfWork. 
	self 
		should: [rover moveBackward]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Rover fuera de rango' ]! !

!MarsRoversTest methodsFor: 'tests' stamp: 'I 5/13/2024 01:15:30'!
test20
	| rover starting |
	starting := Point
		x: 1
		y: 2.
	rover := MarsRovers
		locationAt: starting
		pointingTo: 'O'
		inWorkingArea:
			(Point
				x: 4
				y: 4).
	rover doAction: 'brf'.	
	self
		assert: 'N'
		equals: rover cardinalLocation.
	self
		assert:
			(Point
				x: 2
				y: 3)
		equals: rover location.! !


!classDefinition: #Actions category: #'Mars Rovers'!
Object subclass: #Actions
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!Actions methodsFor: 'action' stamp: 'I 5/13/2024 01:18:29'!
doOnRover: aMarsRovers

	self subclassResponsibility! !


!classDefinition: #B category: #'Mars Rovers'!
Actions subclass: #B
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!B methodsFor: 'action' stamp: 'I 5/13/2024 01:18:45'!
doOnRover: aMarsRovers 
	aMarsRovers moveBackward.! !


!classDefinition: #F category: #'Mars Rovers'!
Actions subclass: #F
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!F methodsFor: 'action' stamp: 'I 5/13/2024 01:18:55'!
doOnRover: aMarsRovers 
	aMarsRovers moveForward ! !


!classDefinition: #L category: #'Mars Rovers'!
Actions subclass: #L
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!L methodsFor: 'action' stamp: 'I 5/13/2024 01:19:07'!
doOnRover: aMarsRovers 
	aMarsRovers rotateToLeft ! !


!classDefinition: #R category: #'Mars Rovers'!
Actions subclass: #R
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!R methodsFor: 'action' stamp: 'I 5/13/2024 01:19:21'!
doOnRover: aMarsRovers 
	aMarsRovers rotateToRight ! !


!classDefinition: #CardinalRule category: #'Mars Rovers'!
Object subclass: #CardinalRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!CardinalRule methodsFor: 'as yet unclassified'!
! !

!CardinalRule methodsFor: 'as yet unclassified'!
! !

!CardinalRule methodsFor: 'as yet unclassified'!
! !

!CardinalRule methodsFor: 'as yet unclassified'!
! !

!CardinalRule methodsFor: 'as yet unclassified'!
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalRule class' category: #'Mars Rovers'!
CardinalRule class
	instanceVariableNames: ''!

!CardinalRule class methodsFor: 'as yet unclassified'!
! !


!classDefinition: #E category: #'Mars Rovers'!
CardinalRule subclass: #E
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!E methodsFor: 'as yet unclassified' stamp: 'I 5/10/2024 00:14:45'!
canMoveBackward: aMarsRovers inAreaOfWork: aWorkingArea 
	(aMarsRovers location x = 0) ifTrue:[^self class error:aMarsRovers class negativeCoordinatesNotAllowed ].
	^self moveBackward ! !

!E methodsFor: 'as yet unclassified'!
! !

!E methodsFor: 'as yet unclassified'!
! !

!E methodsFor: 'as yet unclassified'!
! !

!E methodsFor: 'as yet unclassified'!
! !

!E methodsFor: 'as yet unclassified'!
! !


!classDefinition: #N category: #'Mars Rovers'!
CardinalRule subclass: #N
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!N methodsFor: 'as yet unclassified' stamp: 'I 5/10/2024 00:02:46'!
canMoveBackward: aRover inAreaOfWork: areaOfWork
	aRover location y = 0 ifTrue: [ ^ aRover class error: aRover class negativeCoordinatesNotAllowed ].
	^ self moveBackward.! !

!N methodsFor: 'as yet unclassified'!
! !

!N methodsFor: 'as yet unclassified'!
! !

!N methodsFor: 'as yet unclassified'!
! !

!N methodsFor: 'as yet unclassified'!
! !

!N methodsFor: 'as yet unclassified'!
! !


!classDefinition: #O category: #'Mars Rovers'!
CardinalRule subclass: #O
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!O methodsFor: 'as yet unclassified' stamp: 'I 5/9/2024 23:49:57'!
canMoveBackward: aRover inAreaOfWork: areaOfWork
	aRover location x = (areaOfWork x) ifTrue: [ ^ aRover class error: aRover class outOfRangeOfWork ].
	^ self moveBackward.
! !

!O methodsFor: 'as yet unclassified' stamp: 'I 5/9/2024 23:57:29'!
canMoveForward: arg1 inAreaOfWork: arg2
	arg1 location x = 0 ifTrue: [ ^ arg1 class error: arg1 class negativeCoordinatesNotAllowed ].
	^ self moveForward.! !

!O methodsFor: 'as yet unclassified'!
! !

!O methodsFor: 'as yet unclassified'!
! !

!O methodsFor: 'as yet unclassified'!
! !

!O methodsFor: 'as yet unclassified'!
! !


!classDefinition: #S category: #'Mars Rovers'!
CardinalRule subclass: #S
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!S methodsFor: 'as yet unclassified' stamp: 'I 5/9/2024 23:49:11'!
canMoveBackward: aRover inAreaOfWork: areaOfWork
	aRover location y = areaOfWork y ifTrue: [ ^ aRover class error: aRover class outOfRangeOfWork ].
	^ self moveBackward.! !

!S methodsFor: 'as yet unclassified' stamp: 'I 5/10/2024 00:03:40'!
canMoveForward: arg1 inAreaOfWork: arg2
	(arg1 location y = 0) ifTrue: [ ^ arg1 class error: arg1 class negativeCoordinatesNotAllowed ].
	^ self moveForward.! !

!S methodsFor: 'as yet unclassified'!
! !

!S methodsFor: 'as yet unclassified'!
! !

!S methodsFor: 'as yet unclassified'!
! !

!S methodsFor: 'as yet unclassified'!
! !


!classDefinition: #MarsRovers category: #'Mars Rovers'!
Object subclass: #MarsRovers
	instanceVariableNames: 'locationPoint cardinalPoint workingArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rovers'!

!MarsRovers methodsFor: 'initialization'!
! !

!MarsRovers methodsFor: 'initialization'!
5/13/2024 01:23:06'! !


!MarsRovers methodsFor: 'action' stamp: 'I 5/13/2024 01:11:39'!
doAction: listOfAction
	listOfAction do: [:action | |actionToRealize|
			actionToRealize := Actions for: action.
			actionToRealize doOnRover: self].! !

!MarsRovers methodsFor: 'action' stamp: 'I 5/10/2024 00:01:39'!
moveBackward
	locationPoint := locationPoint + (cardinalPoint canMoveBackward: self inAreaOfWork: workingArea).! !

!MarsRovers methodsFor: 'action'!
! !

!MarsRovers methodsFor: 'action'!
! !

!MarsRovers methodsFor: 'action'!
! !


!MarsRovers methodsFor: 'accesing'!
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRovers class' category: #'Mars Rovers'!
MarsRovers class
	instanceVariableNames: ''!

!MarsRovers class methodsFor: 'instance creation'!
! !

!MarsRovers class methodsFor: 'instance creation'!
sity-6169.image priorSource: 8573738! !

!MarsRovers class methodsFor: 'instance creation'!
5:37) CuisUniversity-6169.image priorSource: 8587013! !

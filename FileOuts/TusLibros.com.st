!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'tests' stamp: 'I 6/5/2024 11:45:30'!
test01CreateCartMeansIsEmpty
	|cart|
	
	cart := Cart new.
	
	self assert: (cart isEmpty).
! !

!CartTest methodsFor: 'tests' stamp: 'I 6/5/2024 18:45:44'!
test02AddABookToACart
	|cart book catalog expectedListCart|
	
	expectedListCart:= Dictionary new.
	expectedListCart at: 1928374617 put:2.
	book := 1928374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	cart := Cart withCatalog: catalog .
	
	
	cart addToCart: book withQuantity: 2.
	
	self assert: expectedListCart equals: (cart listCart ).! !

!CartTest methodsFor: 'tests' stamp: 'I 6/5/2024 18:46:04'!
test03BookOutOfPrint
	|cart book catalog bookOutOfPrint|
	
	bookOutOfPrint := 1928374614.
	book := 1928374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	cart := Cart withCatalog: catalog .
	
	
	self should: [cart addToCart: bookOutOfPrint withQuantity: 2] 
	raise:  Error - MessageNotUnderstood 
	description: [:anError | self assert: anError equals: (catalog error: catalog outOfPrint) ]! !

!CartTest methodsFor: 'tests' stamp: 'I 6/5/2024 18:46:24'!
test04InvalidQuantity
	|cart book catalog bookOutOfPrint|
	
	bookOutOfPrint := 1928374614.
	book := 1928374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	cart := Cart withCatalog: catalog .
	
	
	self should: [cart addToCart: bookOutOfPrint withQuantity: -1] 
	raise:  Error - MessageNotUnderstood 
	description: [:anError | self assert: anError equals: (Cart class error: (Cart invalidNumber)) ]! !

!CartTest methodsFor: 'tests' stamp: 'I 6/5/2024 18:46:29'!
test05RememberBookInCart
	|cart book catalog bookOutOfPrint|
	
	bookOutOfPrint := 1928374614.
	book := 1928374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	cart := Cart withCatalog: catalog .
	
	cart addToCart: book withQuantity: 1.
	
	self assert: (cart includes: book).
	self deny: (cart includes: bookOutOfPrint )! !


!classDefinition: #CashierTest category: #'TusLibros.com'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CashierTest methodsFor: 'tests' stamp: 'I 6/5/2024 13:27:46'!
test01CashierCantCheckOutAnEmptyCart
	|cashier cart|
	
	cart := Cart new.
	
	cashier := Cashier new.
	
	self should: [cashier checkOut: cart]
	raise: Error - MessageNotUnderstood 
	description: [:anError | self assert: anError messageText equals: (cashier checkOutEmptyCart)]! !

!CashierTest methodsFor: 'tests' stamp: 'I 6/5/2024 18:31:44'!
test02CashierCheckOutACartWithOneBook
	|cashier cart book catalog total|
	
	book := 1928374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	cart := Cart withCatalog: catalog .
	
	cart add: book.
	cashier := Cashier new.
	
	total := cashier checkOut: cart.
	
	self assert: 10 equals: total.! !

!CashierTest methodsFor: 'tests' stamp: 'I 6/5/2024 23:42:07'!
test03CashierCheckOutACartWithTwoBook
	|cashier cart book anotherBook catalog total creditCard|
	
	creditCard := CreditCard withNumber: 1003812903712037 withExpirationDate: 022030 withOwner: 'Jose'.
	
	book := 1928374617.
	anotherBook := 1913374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	catalog at: anotherBook put: 20.
	cart := Cart withCatalog: catalog .
	
	cart add: book.
	cart add: anotherBook .
	cashier := Cashier new.
	
	total := cashier checkOut: cart.
	
	self assert: 30 equals: total.! !

!CashierTest methodsFor: 'tests' stamp: 'I 6/5/2024 18:34:12'!
test04CashierCheckOutACartWithTwoBookAndMoreThanOne
	|cashier cart book anotherBook catalog total|
	
	book := 1928374617.
	anotherBook := 1913374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	catalog at: anotherBook put: 20.
	cart := Cart withCatalog: catalog .
	
	cart add: book.
	cart addToCart: anotherBook withQuantity:2. 
	cashier := Cashier new.
	
	total := cashier checkOut: cart.
	
	self assert: 50 equals: total.! !

!CashierTest methodsFor: 'tests' stamp: 'I 6/6/2024 00:30:49'!
test05CashierChecksIsValidCardAndChecksOutACartWithTwoBook
	|cashier cart book anotherBook catalog total creditCard|
	
	creditCard := CreditCard withNumber: '1003812903712037' withExpirationDate: '022030' withOwner: 'Jose'.
	
	book := 1928374617.
	anotherBook := 1913374617.
	
	catalog := Dictionary new.
	catalog at: book put: 10.
	catalog at: anotherBook put: 20.
	cart := Cart withCatalog: catalog .
	
	cart add: book.
	cart add: anotherBook .
	cashier := Cashier new.
	
	total := cashier checkOut: cart.
	
	self assert: 30 equals: total.! !


!classDefinition: #Cart category: #'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'listOfBooks catalogs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'Purchases' stamp: 'i 6/5/2024 16:51:27'!
listCart
	
	| list |
    
    list := Dictionary new.

    listOfBooks do: [:book | 
        (list includesKey: book)
            ifTrue: [ list at: book put: (list at: book) + 1 ]
            ifFalse: [ list at: book put: 1 ]
    ].
    
    ^list! !


!Cart methodsFor: 'initialization' stamp: 'i 6/5/2024 16:32:58'!
initialize 
	listOfBooks := Bag new.
	catalogs := OrderedCollection new.
	! !

!Cart methodsFor: 'initialization' stamp: 'I 6/2/2024 14:33:16'!
initializeWithCatalog: catalog 

	catalogs := catalog.! !


!Cart methodsFor: 'adding' stamp: 'i 6/5/2024 16:33:08'!
add: book 
	listOfBooks add: book! !

!Cart methodsFor: 'adding' stamp: 'i 6/5/2024 16:33:24'!
addToCart: book withQuantity: quantity
	self validQuantity: quantity .
	self assertISBNOfBook: book.
	
	listOfBooks add: book withOccurrences: quantity 
	! !

!Cart methodsFor: 'adding' stamp: 'I 6/5/2024 18:44:59'!
assertISBNOfBook: book
	(catalogs includesKey: book) ifFalse:[self class error: (self class OutOfPrint)]! !


!Cart methodsFor: 'testing' stamp: 'I 6/5/2024 18:43:03'!
includes: book 
	^listOfBooks includes: book.! !

!Cart methodsFor: 'testing' stamp: 'I 6/5/2024 11:44:53'!
isEmpty
	^listOfBooks isEmpty ! !

!Cart methodsFor: 'testing' stamp: 'I 6/2/2024 16:00:37'!
validQuantity: quantity 
	(quantity > 0) ifFalse:[^self class error: (self class invalidNumber)].! !


!Cart methodsFor: 'as yet unclassified' stamp: 'I 6/5/2024 18:37:16'!
priceFor: aBook 
	^catalogs at:aBook.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'I 6/2/2024 14:32:09'!
withCatalog: catalog 
	"DO NOT FORGET TO RENAME COLLABORATORS AND REMOVE THIS COMMENT!!!!"
	^self new initializeWithCatalog: catalog ! !


!Cart class methodsFor: 'error' stamp: 'I 6/5/2024 11:44:00'!
OutOfPrint
	^'Book out of print'! !

!Cart class methodsFor: 'error' stamp: 'I 6/2/2024 16:01:33'!
invalidNumber
	^'Invalid Number'! !


!classDefinition: #Cashier category: #'TusLibros.com'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cashier methodsFor: 'checking' stamp: 'I 6/5/2024 18:37:28'!
checkOut: cart 
	|total|
	
	total := 0.
	
	self assertIsNotEmpty: cart. 

	
	(cart listCart) keysAndValuesDo: [:aBook :aQuant| total := total +( (cart priceFor: aBook)* aQuant) ].
	
	^total! !


!Cashier methodsFor: 'error' stamp: 'I 6/5/2024 13:24:54'!
checkOutEmptyCart
	^'Cant check out an empty cart!!!!!!'! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'i 6/5/2024 15:34:29'!
assertIsNotEmpty: cart
	(cart isEmpty) ifTrue:[^self error: self checkOutEmptyCart].! !


!classDefinition: #CreditCard category: #'TusLibros.com'!
Object subclass: #CreditCard
	instanceVariableNames: 'expitarionDate ownerName cardNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CreditCard methodsFor: 'initialization' stamp: 'I 6/5/2024 23:41:14'!
initializeWithNumber: aCardNumber withExpirationDate: expirationDateOfCard withOwner: cardOwnerOfCard
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros.com'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'I 6/6/2024 00:40:23'!
withNumber: aCardNumber withExpirationDate: expirationDate withOwner: cardOwner 
	^(self subclasses detect:[:subclass| subclass canHandleNumber: aCardNumber anExpirationDate: expirationDate]) withNumber: aCardNumber withExpirationDate: expirationDate withOwner: cardOwner .
"
	^self new initializeWithNumber: aCardNumber withExpirationDate: expirationDate withOwner: cardOwner "! !


!classDefinition: #InvalidCreditCard category: #'TusLibros.com'!
CreditCard subclass: #InvalidCreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidCreditCard class' category: #'TusLibros.com'!
InvalidCreditCard class
	instanceVariableNames: ''!

!InvalidCreditCard class methodsFor: 'assert' stamp: 'I 6/6/2024 00:38:42'!
assertDate: expirationDate 
	| month year currentYear currentMonth |
	
	month := expirationDate copyFrom: 1 to: 2. 
	year := expirationDate copyFrom: 3 to: 6.

	"Convertir los valores a números"
	month := month asNumber .
	year := year asNumber .

	"Obtener el mes y año actual"
	currentYear := Date today yearNumber .
	currentMonth := Date today monthIndex .

	"Validar el formato y la validez de la fecha"
	^((month between: 1 and: 12)not)
	   or:[
	(year > currentYear or: (year = currentYear and: month > currentMonth))
	    ]! !

!InvalidCreditCard class methodsFor: 'assert' stamp: 'I 6/6/2024 00:22:11'!
canHandleNumber: aCardNumber anExpirationDate: expirationDate 
	^(((aCardNumber size) = 16) not) or:[self assertDate: expirationDate].! !


!InvalidCreditCard class methodsFor: 'initialization' stamp: 'I 6/6/2024 00:40:52'!
withNumber: aCardNumber withExpirationDate: expirationDate withOwner: cardOwner! !


!classDefinition: #ValidCreditCard category: #'TusLibros.com'!
CreditCard subclass: #ValidCreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidCreditCard class' category: #'TusLibros.com'!
ValidCreditCard class
	instanceVariableNames: ''!

!ValidCreditCard class methodsFor: 'as yet unclassified' stamp: 'I 6/6/2024 00:30:45'!
canHandleNumber: aCardNumber anExpirationDate: expirationDate 
	^(((aCardNumber size) = 16)) or:[self assertDate: expirationDate].! !

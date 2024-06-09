!classDefinition: #AccountSummaryTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'I 5/28/2024 23:47:45'!
test01CreateAndDepositOnAccount

	|account deposit accountSummary|
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: account.
	
	accountSummary := AccountSummaryVisitor for: account.
	
	self assert: 'Deposito por 100. Balance = 100' equals: (accountSummary lines)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'I 5/29/2024 00:00:49'!
test02CreateAndDoNothingExpectBalanceZero

	|account accountSummary|
	
	account := ReceptiveAccount new.
	
	accountSummary := AccountSummaryVisitor for: account.
	
	self assert: 'Balance = 0' equals: (accountSummary lines)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'I 5/28/2024 23:47:53'!
test03anAccountHasAWithdrawTransaction

	|account accountSummary withdraw|
	
	account := ReceptiveAccount new.
	
	withdraw := Withdraw register: 50 on: account.
	
	accountSummary := AccountSummaryVisitor for: account.
	
	self assert: 'Extraccion por 50. Balance = -50' equals: (accountSummary lines)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'I 5/28/2024 23:48:03'!
test04anAccountTransfersToAnotherAccount

	|sourceAccount destinationAccount sourceAccountSummary  destinationAccountSummary deposit transfer|
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: sourceAccount.
	
	transfer := Transfer from: sourceAccount to: destinationAccount  transferAmountOfMoney: 20.
	
	sourceAccountSummary := AccountSummaryVisitor for: sourceAccount.
	destinationAccountSummary := AccountSummaryVisitor for: destinationAccount .
	
	self assert: 'Deposito por 50. Salida por transferencia de 20. Balance = 30' equals: (sourceAccountSummary lines).
	self assert: 'Entrada por transferencia de 20. Balance = 20' equals: (destinationAccountSummary lines)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'I 5/28/2024 23:46:54'!
test05aSummaryOnPortfolio

	|sourceAccount destinationAccount portfolio portfolioSummary deposit transfer|
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: sourceAccount.
	
	transfer := Transfer from: sourceAccount to: destinationAccount  transferAmountOfMoney: 20.
	
	portfolio := Portfolio with: sourceAccount with: destinationAccount .
	
	portfolioSummary := AccountSummaryVisitor for: portfolio .
	
	
	self assert: 'Deposito por 50. Salida por transferencia de 20. Entrada por transferencia de 20. Balance = 50' equals: (portfolioSummary lines)! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'I 5/28/2024 23:55:36'!
test06aSummaryOnCompoundPortfolio

	|sourceAccount destinationAccount portfolio portfolioSummary deposit transfer compoundPortfolio anotherAccount|
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new register: (Deposit for: 50).
	
	deposit := Deposit register: 50 on: sourceAccount.
	
	transfer := Transfer from: sourceAccount to: destinationAccount  transferAmountOfMoney: 20.
	
	portfolio := Portfolio with: sourceAccount with: destinationAccount .
	
	compoundPortfolio := Portfolio with: portfolio with: anotherAccount .
	
	portfolioSummary := AccountSummaryVisitor for: compoundPortfolio .
	
	
	self assert: 'Deposito por 50. Salida por transferencia de 20. Entrada por transferencia de 20. Deposito por 50. Balance = 100' equals: (portfolioSummary lines)! !


!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/16/2024 11:33:49'!
test01
	|portfolio|
	
	portfolio  := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/23/2024 17:19:16'!
test02
	|portfolio account deposit|
	
	account := ReceptiveAccount new.
	deposit  := Deposit register: 100 on: account .
	portfolio  := Portfolio with: account.

	
	self assert: 100 equals:( portfolio balance).! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/23/2024 17:34:05'!
test03
	|portfolio account deposit portfolio2 account2  deposit2|
	
	account := ReceptiveAccount new.
	deposit  := Deposit register: 100 on: account .
	portfolio  := Portfolio with: account.
	
	account2 := ReceptiveAccount new.
	deposit2  := Deposit register: 100 on: account2 .
	portfolio2  := Portfolio with: account2.
	
	portfolio add: portfolio2 .


	
	self assert: 200 equals:( portfolio balance).
	self assert: (portfolio hasRegistered: deposit2 ).
	self deny: (portfolio2 hasRegistered: deposit )! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/23/2024 17:35:33'!
test04
	|portfolio account deposit portfolio2 portfolio3 account2 account3 deposit2|
	
	account := ReceptiveAccount new.
	deposit  := Deposit register: 100 on: account .
	portfolio  := Portfolio with: account.
	
	account2 := ReceptiveAccount new.
	deposit2  := Deposit register: 100 on: account2 .
	portfolio2  := Portfolio with: account2.
	
	
	
	account3 := ReceptiveAccount new. 
	account3 register:(Withdraw  for: 50).
	portfolio3  := Portfolio with: account3 .
	portfolio2 add: portfolio3 .
	portfolio add: portfolio2 .
	
	
	self assert: 150 equals:( portfolio balance).! !

!PortfolioTest methodsFor: 'tests' stamp: 'i 5/16/2024 21:07:57'!
test05
	|portfolio account deposit|
	
	account := ReceptiveAccount new.
	deposit  := Deposit register: 100 on: account .
	portfolio  := Portfolio new.
	portfolio addAcount: account.

	
	self assert:( portfolio hasRegistered:deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'i 5/16/2024 21:14:12'!
test06
	|portfolio account deposit|
	
	account := ReceptiveAccount new.
	deposit  := Deposit for: 100  .
	portfolio  := Portfolio new.
	portfolio addAcount: account.

	
	self deny:( portfolio hasRegistered:deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/26/2024 11:10:49'!
test07
	|compoundPortfolio account deposit simplePortfolio account2 deposit2|
	
	account := ReceptiveAccount new.
	deposit  := Deposit register: 100 on: account .
	compoundPortfolio  := Portfolio with: account.
	
	account2 := ReceptiveAccount new.
	deposit2  := Deposit register: 100 on: account2 .
	simplePortfolio  := Portfolio with: account2.
	
	compoundPortfolio add: simplePortfolio. 
	
	
	self should:[simplePortfolio add: account ] 
	raise: Error - MessageNotUnderstood 
	description: [:anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: (compoundPortfolio hasRegistered: deposit2 )].! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/23/2024 19:02:52'!
test08PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/26/2024 11:10:13'!
test09PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/26/2024 11:21:24'!
test10PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/26/2024 11:21:47'!
test11PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/26/2024 11:22:09'!
test12ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/26/2024 11:23:34'!
test13ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'I 5/26/2024 11:31:21'!
test14PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:01:17'!
test01DepositExpectsTransferNetZero
	|account transferNet |
	
	account := ReceptiveAccount new register: (Deposit for: 100).
	
	transferNet := TransferNetVisitor for: account.
	
	self assert: 0 equals: (transferNet netValue). ! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:40:01'!
test02WithdrawExpectsTransferNetZero
	|account transferNet |
	
	account := ReceptiveAccount new register: (Withdraw for: 100).
	
	transferNet := TransferNetVisitor for: account.
	
	self assert: 0 equals: (transferNet netValue). ! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:45:09'!
test03AccountTransferAndGetDeposit
	|sourceAccount destinationAccount    deposit transfer transferNetForSource transferNetForDestination|
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: sourceAccount.
	
	transfer := Transfer from: sourceAccount to: destinationAccount  transferAmountOfMoney: 20.
	
	transferNetForSource := TransferNetVisitor for: sourceAccount .
	transferNetForDestination := TransferNetVisitor for: destinationAccount .
	
	self assert: -20 equals: (transferNetForSource netValue ).
	self assert: 20 equals: (transferNetForDestination netValue ).
	! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'I 5/29/2024 00:12:47'!
test04AccountTranferInPortfolio
	|sourceAccount destinationAccount portfolio deposit transfer transferNet|
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: sourceAccount.
	
	transfer := Transfer from: sourceAccount to: destinationAccount  transferAmountOfMoney: 20.
	
	portfolio := Portfolio with: sourceAccount with: destinationAccount .
	
	transferNet := TransferNetVisitor for: portfolio.
	
	self assert: 0 equals: (transferNet netValue ).
	! !


!classDefinition: #TransferTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'I 5/26/2024 15:51:30'!
test01AccountTransferMoneyToAnotherAccount
	| account1 deposit1 account2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
	Transfer from: account1 to: account2 transferAmountOfMoney: 20.
		
	self assert: 2 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
	self assert: 30 equals: (account1 balance )
! !

!TransferTest methodsFor: 'tests' stamp: 'I 5/26/2024 16:17:35'!
test02AccountTransfersToItself
	|account1 deposit1 |
	
	account1 := ReceptiveAccount new.

	deposit1 := Deposit register: 50 on: account1.
	self should: [Transfer from: account1 to: account1 transferAmountOfMoney: 20] 
	raise: Error - MessageNotUnderstood 
	description: [:anError | self assert: Transfer sameAccountError equals: anError messageText ]! !

!TransferTest methodsFor: 'tests' stamp: 'I 5/28/2024 10:39:50'!
test03AccountTransfersNegativeAmount
	|account1 deposit1 account2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	

	deposit1 := Deposit register: 50 on: account1.
	self should: [Transfer from: account1 to: account2 transferAmountOfMoney: -20] 
	raise: Error - MessageNotUnderstood 
	description: [:anError | self assert: Transfer invalidAmount equals: anError messageText ]! !

!TransferTest methodsFor: 'tests' stamp: 'I 5/28/2024 10:56:28'!
test04AccountTransfersNegativeAmount
	|account1 deposit1 account2 transfer|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	

	deposit1 := Deposit register: 50 on: account1.
	
	transfer := Transfer from: account1 to:  account2 transferAmountOfMoney: 	100.
	
	self assert: (transfer withdrawLegGetTransfer = transfer ).
	self assert: (transfer depositLegGetTransfer = transfer )! !


!classDefinition: #Account category: #'Portfolio-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'movements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'value' stamp: 'I 5/26/2024 11:14:57'!
accountsSize
	|size|
	size := 0.
	
	accounts do:[:anAccount| size := size + anAccount  accountsSize].
	
	^size.! !

!Portfolio methodsFor: 'value' stamp: 'I 5/23/2024 17:19:04'!
balance
	
	^ accounts sum:[:account| account balance]ifEmpty: [^0].
	! !

!Portfolio methodsFor: 'value' stamp: 'I 5/23/2024 16:18:01'!
hasRegistered: transaction
	|accum|
	accum := false.
	accounts do:[:account | accum := (account hasRegistered: transaction) or:[accum] ] .
	^accum! !


!Portfolio methodsFor: 'adding' stamp: 'I 5/28/2024 16:41:48'!
add: account 

	self canAddAnAccount: account.
	
	accounts add: account.

	
	account addRootParent: self.
	! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/27/2024 12:44:55'!
addAcount: account 
	accounts add: account
	! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/23/2024 19:22:45'!
addParentsTo: rootsParents
	
	parents ifEmpty: [rootsParents add: self]
	 ifNotEmpty: [parents do:[:aParent| aParent addParentsTo: rootsParents ]].! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/23/2024 17:33:14'!
addRootParent: anAccount
	parents add: anAccount 
	! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/23/2024 19:00:21'!
addTransactionsTo: transactions
	accounts do: [:anAccount | anAccount addTransactionsTo: transactions].! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/26/2024 11:10:49'!
canAddAnAccount: account 
	(self parentsHaveAnAccount: account) 	ifTrue: [^self class error: self class canNotAddAccountErrorMessage].! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/26/2024 11:33:02'!
isComposedBy: account 
	^accounts anySatisfy: [:anAccount| (anAccount = account )or:[anAccount isComposedBy: account] or: [account isComposedBy: anAccount ]].! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/23/2024 19:12:59'!
parentsHaveAnAccount: account

	^self rootsParents anySatisfy: [:aParent| aParent isComposedBy: account ].! !

!Portfolio methodsFor: 'adding' stamp: 'I 5/23/2024 19:21:52'!
rootsParents

	|rootsParents|
	
	rootsParents := Set new.
	
	self addParentsTo: rootsParents .
	
	^rootsParents ! !


!Portfolio methodsFor: 'initialization' stamp: 'I 5/27/2024 13:38:25'!
initialize
	movements := OrderedCollection new.
	accounts  := OrderedCollection new.
	parents  := OrderedCollection new
	! !


!Portfolio methodsFor: 'boolean' stamp: 'I 5/26/2024 11:21:00'!
accountsIncludes: account 
	^accounts anySatisfy: [:anAccount| (anAccount = anAccount ) or:[anAccount accountsIncludes: account ]].! !

!Portfolio methodsFor: 'boolean' stamp: 'I 5/23/2024 17:52:52'!
hasAccount: anAccount 
	^accounts anySatisfy: [:account | account = anAccount ]! !


!Portfolio methodsFor: 'transactions' stamp: 'I 5/29/2024 00:13:32'!
accept: aVisitor 
	accounts do:[:anAccount | anAccount accept: aVisitor ].! !

!Portfolio methodsFor: 'transactions' stamp: 'I 5/23/2024 18:59:36'!
transactions
	|transactionsList|
	
	transactionsList := Set new.
	
	accounts do: [:anAccount | anAccount addTransactionsTo: transactionsList ].
	

	^transactionsList .! !


!Portfolio methodsFor: 'testing' stamp: 'I 5/26/2024 11:23:07'!
accountsIsEmpty
	^accounts size = 0! !


!Portfolio methodsFor: 'reports' stamp: 'I 5/27/2024 13:38:25'!
reports
	|text|
	text := ''.
	movements do:[:report| text := text , report , Character lf asString].
	"accounts do: [:anAccount | (anAccount isKindOf: Portfolio  ) ifTrue:[text := text , anAccount reports]
														ifFalse: [text := text , anAccount reports, Character lf asString]]."
	text := text, 'Balance = ',(self balance asString).
	^text.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'nil' stamp: 'I 5/23/2024 17:14:44'!
with: anAccount
	^self new add: anAccount.! !


!Portfolio class methodsFor: 'as yet unclassified' stamp: 'I 5/26/2024 11:11:05'!
canNotAddAccountErrorMessage
	^'Can put repetitive accounts'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'I 5/23/2024 19:03:24'!
with: anAccount with: anotherAccount
	^self new add: anAccount; add: anotherAccount .! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'I 5/27/2024 13:38:25'!
initialize

	transactions := OrderedCollection new.
	parents := OrderedCollection new.
	movements := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'I 5/23/2024 19:01:12'!
addTransactionsTo: transactionsList
	transactions do: [:transaction | transactionsList add: transaction ].! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'I 5/28/2024 11:32:20'!
getSummaryFor: anAccountSummary 
	
	transactions do:[:aTransaction| aTransaction getSummaryFor: anAccountSummary ].! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'I 5/26/2024 23:19:18'!
register: aTransaction

	transactions add: aTransaction .
	aTransaction defineReportOnAccount: self .
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'i 5/16/2024 20:48:35'!
balance
	|balance|
	balance := 0.
	transactions do: [ :aTransaction |balance := aTransaction addTo: balance ].
	^balance ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'I 5/26/2024 11:20:29'!
accountsIncludes: account 
	^self = account ! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'I 5/23/2024 19:24:29'!
isComposedBy: account
	^account = self.! !


!ReceptiveAccount methodsFor: 'boolean' stamp: 'I 5/23/2024 17:25:47'!
addRootParent: aPortfolio 
	parents add: aPortfolio.! !

!ReceptiveAccount methodsFor: 'boolean' stamp: 'I 5/23/2024 17:41:37'!
canAddAccount: account 
	^false! !


!ReceptiveAccount methodsFor: 'transfersActions' stamp: 'I 5/26/2024 11:13:11'!
accountsSize
	^1! !

!ReceptiveAccount methodsFor: 'transfersActions' stamp: 'I 5/27/2024 13:38:25'!
defindeDepositTransferWithAmount: depositTransfer 
	movements add: 'Entrada por transferencia de ' , (depositTransfer asString ).! !

!ReceptiveAccount methodsFor: 'transfersActions' stamp: 'I 5/26/2024 23:24:42'!
defineDepositReport
	self shouldBeImplemented.! !

!ReceptiveAccount methodsFor: 'transfersActions' stamp: 'I 5/27/2024 13:38:25'!
defineDepositReportWithValue: amount
	movements add: ('Deposito por ' , amount asString)! !

!ReceptiveAccount methodsFor: 'transfersActions' stamp: 'I 5/27/2024 13:38:25'!
defineTransferWithdrawWithAMount: transferAmount
	movements add: 'Salida por transferencia de ', (transferAmount asString) .! !

!ReceptiveAccount methodsFor: 'transfersActions' stamp: 'I 5/27/2024 13:38:25'!
defineWithdrawWithAmount: amount
	movements add: ('Extraccion por ', amount asString )! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:32:05'!
accept: aTransactionVisitor 
	transactions do:[:aTransaction | aTransaction accept: aTransactionVisitor ].! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:06:39'!
getTransferValue: aTransferNetVisitor 
	transactions do:[:aTransaction | aTransaction getTransferValue: aTransferNetVisitor ].! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'transaction' stamp: 'I 5/26/2024 23:17:52'!
defineReportOn: aReportsList 
	^aReportsList add: 'Deposito por' , (self value asString )! !

!AccountTransaction methodsFor: 'transaction' stamp: 'I 5/28/2024 12:06:12'!
getSummaryFor: anAccountSummary

	self subclassResponsibility! !


!AccountTransaction methodsFor: 'transfer' stamp: 'I 5/27/2024 13:55:34'!
transferNet
	^0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'add' stamp: 'i 5/16/2024 20:47:22'!
addTo: balance 
	^balance + value! !


!Deposit methodsFor: 'transaction' stamp: 'I 5/28/2024 13:33:14'!
accept: aTransactionVisitor 
	aTransactionVisitor doOperationForDeposit: self .! !

!Deposit methodsFor: 'transaction' stamp: 'I 5/26/2024 23:29:19'!
defineReportOnAccount: aReceptiveAccount 
	aReceptiveAccount defineDepositReportWithValue: (self value).! !

!Deposit methodsFor: 'transaction' stamp: 'I 5/28/2024 12:37:47'!
getSummaryFor: anAccountSummary 
	anAccountSummary doSummaryForForDeposit: self.! !

!Deposit methodsFor: 'transaction' stamp: 'I 5/28/2024 13:25:47'!
getTransferValue: aTransferNetVisitor 
	aTransferNetVisitor transferForDeposit: (self ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'I 5/26/2024 15:41:32'!
initializeFor: aTransfer onAccount: anAccount 
	transfer := aTransfer .
	account := anAccount .
	
	anAccount register: self.! !

!TransferLeg methodsFor: 'initialization' stamp: 'I 5/27/2024 11:50:59'!
transferValue
	^transfer value! !


!TransferLeg methodsFor: 'testing' stamp: 'I 5/28/2024 10:55:22'!
hasTransfer
	^transfer ! !

!TransferLeg methodsFor: 'testing' stamp: 'I 5/28/2024 10:54:11'!
hasTransfer: aTransfer 
	^transfer  = aTransfer ! !

!TransferLeg methodsFor: 'testing' stamp: 'I 5/28/2024 10:49:21'!
isValidAccount: sourceAccount 
	^account = sourceAccount ! !


!TransferLeg methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 10:54:24'!
transferNet
	^(self transferValue )* (-1)! !


!TransferLeg methodsFor: 'transaction' stamp: 'I 5/28/2024 12:25:34'!
getSummaryFor: anAccountSummary 
	self subclassResponsibility .! !


!classDefinition: #DepositLeg category: #'Portfolio-Ejercicio'!
TransferLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:33:36'!
accept: aTransactionVisitor 
	aTransactionVisitor doOperationForDepositLeg: self .! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'I 5/26/2024 15:57:48'!
addTo: balanceAffected
	^ balanceAffected + transfer value! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'I 5/27/2024 11:48:28'!
defineReportOnAccount: aReceptiveAccount 
	aReceptiveAccount defindeDepositTransferWithAmount: (self transferValue ).! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 12:25:40'!
getSummaryFor: anAccountSummary 
	anAccountSummary doSummaryForTransferDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: #'Portfolio-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'as yet unclassified' stamp: 'I 5/26/2024 15:36:30'!
for: transfer onAccount: account
	^self new initializeFor: transfer onAccount: account .! !


!classDefinition: #WithdrawLeg category: #'Portfolio-Ejercicio'!
TransferLeg subclass: #WithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:33:47'!
accept: aTransactionVisitor 
	aTransactionVisitor doOperationForWithdrawLeg: self .! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'I 5/26/2024 15:57:59'!
addTo: balanceAffected
	^ balanceAffected - transfer value! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'I 5/27/2024 11:45:43'!
defineReportOnAccount: aReceptiveAccount 
	aReceptiveAccount defineTransferWithdrawWithAMount: (self transferValue ).! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 12:25:52'!
getSummaryFor: anAccountSummary 
	anAccountSummary doSummaryForTransferWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: #'Portfolio-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'as yet unclassified' stamp: 'I 5/26/2024 15:51:59'!
for: transfer onAccount: account
	^self new initializeFor: transfer onAccount: account .! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'add' stamp: 'i 5/16/2024 20:47:53'!
addTo: balance 
	^balance - value! !


!Withdraw methodsFor: 'transaction' stamp: 'I 5/28/2024 13:33:58'!
accept: aTransactionVisitor 
	aTransactionVisitor doOperationForWithdraw: self .! !

!Withdraw methodsFor: 'transaction' stamp: 'I 5/26/2024 23:44:49'!
defineReportOnAccount: aReceptiveAccount 
	aReceptiveAccount defineWithdrawWithAmount: (self value)! !

!Withdraw methodsFor: 'transaction' stamp: 'I 5/28/2024 12:38:02'!
getSummaryFor: anAccountSummary 
	anAccountSummary doSummaryForWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransactionVisitor category: #'Portfolio-Ejercicio'!
Object subclass: #TransactionVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransactionVisitor methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:35:14'!
doOperationForDeposit: aDeposit

	self subclassResponsibility! !

!TransactionVisitor methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:35:17'!
doOperationForDepositLeg: aDepositLeg

	self subclassResponsibility! !

!TransactionVisitor methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:35:21'!
doOperationForWithdraw: aWithdraw

	self subclassResponsibility! !

!TransactionVisitor methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 13:35:28'!
doOperationForWithdrawLeg: aWithdrawLeg

	self subclassResponsibility! !


!classDefinition: #AccountSummaryVisitor category: #'Portfolio-Ejercicio'!
TransactionVisitor subclass: #AccountSummaryVisitor
	instanceVariableNames: 'account summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountSummaryVisitor methodsFor: 'initialization' stamp: 'I 5/28/2024 12:45:38'!
initializeFor: anAccount 
	account := anAccount .
	summary := OrderedCollection new.! !


!AccountSummaryVisitor methodsFor: 'summaryOperation' stamp: 'I 5/28/2024 13:36:03'!
doOperationForDeposit: aDeposit
	summary add: 'Deposito por ' , (aDeposit value printString ), '.'! !

!AccountSummaryVisitor methodsFor: 'summaryOperation' stamp: 'I 5/28/2024 13:36:26'!
doOperationForDepositLeg: aDepositLeg
	summary add: 'Entrada por transferencia de ', (aDepositLeg transferValue printString ), '.'.! !

!AccountSummaryVisitor methodsFor: 'summaryOperation' stamp: 'I 5/28/2024 13:36:41'!
doOperationForWithdraw: aWithdraw
	summary add: 'Extraccion por ' , (aWithdraw value printString ) , '.'.! !

!AccountSummaryVisitor methodsFor: 'summaryOperation' stamp: 'I 5/28/2024 13:36:57'!
doOperationForWithdrawLeg: aWithdrawLeg
	summary add: 'Salida por transferencia de ', (aWithdrawLeg transferValue printString ), '.'.! !


!AccountSummaryVisitor methodsFor: 'as yet unclassified' stamp: 'I 5/29/2024 00:00:38'!
lines
	|text|
	
	account accept: self. 
	text := ''.
	
	summary do: [:aSummary | text := text , aSummary ,' '].
	
	text := text , 'Balance = ',(account balance printString ).
	
	^text.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryVisitor class' category: #'Portfolio-Ejercicio'!
AccountSummaryVisitor class
	instanceVariableNames: ''!

!AccountSummaryVisitor class methodsFor: 'instance creation' stamp: 'I 5/27/2024 13:36:00'!
for: account 

	^self new initializeFor: account ! !


!classDefinition: #TransferNetVisitor category: #'Portfolio-Ejercicio'!
TransactionVisitor subclass: #TransferNetVisitor
	instanceVariableNames: 'account trasnferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransferNetVisitor methodsFor: 'initialization' stamp: 'I 5/28/2024 12:45:57'!
initializeFor: anAccount
	account := anAccount.
	trasnferNet := 0.! !

!TransferNetVisitor methodsFor: 'initialization' stamp: 'I 5/28/2024 13:40:18'!
netValue
	account accept: self.
	
	^trasnferNet .! !


!TransferNetVisitor methodsFor: 'transferOperation' stamp: 'I 5/28/2024 13:41:28'!
doOperationForDeposit: aDeposit
	! !

!TransferNetVisitor methodsFor: 'transferOperation' stamp: 'I 5/28/2024 13:46:58'!
doOperationForDepositLeg: aDepositLeg
	trasnferNet := trasnferNet  + (aDepositLeg transferValue)! !

!TransferNetVisitor methodsFor: 'transferOperation' stamp: 'I 5/28/2024 13:38:04'!
doOperationForWithdraw: aWithdraw
! !

!TransferNetVisitor methodsFor: 'transferOperation' stamp: 'I 5/28/2024 13:46:53'!
doOperationForWithdrawLeg: aWithdrawLeg
	trasnferNet := trasnferNet  - (aWithdrawLeg transferValue )! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNetVisitor class' category: #'Portfolio-Ejercicio'!
TransferNetVisitor class
	instanceVariableNames: ''!

!TransferNetVisitor class methodsFor: 'instance creation' stamp: 'I 5/27/2024 13:50:19'!
for: account 

	^self new initializeFor: account ! !


!classDefinition: #Transfer category: #'Portfolio-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'sourceLeg destinationLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'I 5/27/2024 11:51:57'!
initializeFrom: account1 to: account2 transfer: money
	value := money.
	sourceLeg := WithdrawLeg for: self onAccount: account1 .
        destinationLeg := DepositLeg for: self onAccount: account2.

	! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'I 5/27/2024 11:51:09'!
value
	^value! !


!Transfer methodsFor: 'testing' stamp: 'I 5/28/2024 10:56:01'!
depositLegGetTransfer
	^destinationLeg hasTransfer .! !

!Transfer methodsFor: 'testing' stamp: 'I 5/28/2024 10:48:47'!
sourceLegIsRegisteredOn: sourceAccount destinationLegIsRegisteredOn: destinationAccount 
	^((sourceLeg isValidAccount: sourceAccount ) and: [destinationLeg isValidAccount: destinationAccount ]). ! !

!Transfer methodsFor: 'testing' stamp: 'I 5/28/2024 10:55:04'!
withdrawLegGetTransfer
	^sourceLeg hasTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 10:38:08'!
assertPositiveAmountOfMoney: money.
	(money < 0) ifTrue: [^self error: self invalidAmount].! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 10:45:53'!
from: account1 to: account2 transferAmountOfMoney: money
	self validTransferFrom: account1 to: account2.
	self assertPositiveAmountOfMoney: money.
	
	^self new initializeFrom: account1 to: account2 transfer: money! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'I 5/28/2024 10:38:33'!
invalidAmount
	^'The transfer needs to be positive'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'I 5/26/2024 16:14:50'!
sameAccountError
	^'Cannot transfer to himself'.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'I 5/26/2024 16:14:28'!
validTransferFrom: account1 to: account2.
	(account1 = 	account2 ) ifTrue: 	[^self error: self sameAccountError].! !


!Transfer class methodsFor: 'testing' stamp: 'I 5/28/2024 10:46:04'!
sourceLegIsRegisteredOn: account1 destinationLegIsRegisteredOn: account2 
! !

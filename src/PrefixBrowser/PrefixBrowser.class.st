Class {
	#name : #PrefixBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'packageList',
		'prefixList',
		'classList',
		'prefixExtractor'
	],
	#category : #PrefixBrowser
}

{ #category : #specs }
PrefixBrowser class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #packageList;
		add: #prefixList;
		add: #classList;
		yourself.
]

{ #category : #initialization }
PrefixBrowser >> connectPresenters [
	| prefixes |
	packageList whenSelectionChangedDo: [ :selection |
		prefixes := prefixExtractor prefixModelsFrom: selection selectedItems.
		
		prefixList
			icons: [ :e | self iconNamed: #smallFontsIcon ];
			items: prefixes;
			selectAll. ].
		
	prefixList whenSelectionChangedDo: [ :selection |
		Transcript show: (selection selectedItems size); cr.
		classList
			icons: [ :e | self iconFor: e ];
			items: (selection selectedItems flatCollect: #classes) ].
]

{ #category : #defaults }
PrefixBrowser >> iconFor: class [
	((class includesBehavior: (Smalltalk globals at: #TestCase ifAbsent: [ false ])) and: [ class isAbstract not ])
		ifTrue: [ class hasPassedTest ifTrue: [ ^ self iconNamed: #testGreenIcon ].
			class hasFailedTest ifTrue: [ ^ self iconNamed: #testYellowIcon ].
			class hasErrorTest ifTrue: [ ^ self iconNamed: #testRedIcon ].
			^ self iconNamed: #testNotRunIcon ].
	class organization classComment ifEmpty: [ ^ self iconNamed: #uncommentedClassIcon ].
	((class includesBehavior: (Smalltalk globals at: #TestCase ifAbsent: [ false ])) and: [ class isAbstract not ])
		ifTrue: [ class hasPassedTest ifTrue: [ ^ self iconNamed: #testGreenIcon ].
			class hasFailedTest ifTrue: [ ^ self iconNamed: #testYellowIcon ].
			class hasErrorTest ifTrue: [ ^ self iconNamed: #testRedIcon ].
			^ self iconNamed: #testNotRunIcon ].
	class organization classComment ifEmpty: [ ^ self iconNamed: #uncommentedClassIcon ].
	^ class systemIcon
]

{ #category : #initialization }
PrefixBrowser >> initialize [ 	
	super initialize.
	prefixExtractor := PrefixExtractor new.
]

{ #category : #initialization }
PrefixBrowser >> initializePresenters [ 
	packageList := self newList.
	prefixList := self newList.
	classList := self newList.
	
	packageList
		icons: [ :e | self iconNamed: #packageIcon ];
		items: Smalltalk packages;
		display: #name;
		enableItemSubstringFilter;
		beMultipleSelection.
		
	prefixList beMultipleSelection.
]

{ #category : #initialization }
PrefixBrowser >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Prefix Browser';
		initialExtent: 800 @ 600
]

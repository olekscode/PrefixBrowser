Class {
	#name : #PrefixExtractor,
	#superclass : #Object,
	#category : #PrefixBrowser
}

{ #category : #'as yet unclassified' }
PrefixExtractor >> prefixModelsFrom: aCollectionOfPackages [
	| prefixModelsDictionary prefix |
	
	prefixModelsDictionary := Dictionary new.
	
	aCollectionOfPackages do: [ :package |
		package definedClasses do: [ :aClass |
			prefix := aClass prefix.
			
			(prefixModelsDictionary at: prefix ifAbsentPut: (PrefixModel forPrefix: prefix))
				classes add: aClass ] ].
		
	^ prefixModelsDictionary values
]

{ #category : #'as yet unclassified' }
PrefixExtractor >> prefixOf: aClass [
	| name words |
	name := aClass name.
	words := aClass name splitIdentifierName.
	
	^ words first
]

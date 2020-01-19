Class {
	#name : #PrefixModel,
	#superclass : #Object,
	#instVars : [
		'classes',
		'prefix'
	],
	#category : #PrefixBrowser
}

{ #category : #'instance creation' }
PrefixModel class >> forPrefix: aPrefix [
	^ self new initializePrefix: aPrefix
]

{ #category : #accessing }
PrefixModel >> classes [
	^ classes
]

{ #category : #initialization }
PrefixModel >> initialize [
	super initialize.
	classes := OrderedCollection new.
]

{ #category : #initialization }
PrefixModel >> initializePrefix: aPrefix [
	prefix := aPrefix
]

{ #category : #accessing }
PrefixModel >> prefix [ 
	^ prefix
]

{ #category : #printing }
PrefixModel >> printOn: aStream [
	aStream nextPutAll: self prefix.
]

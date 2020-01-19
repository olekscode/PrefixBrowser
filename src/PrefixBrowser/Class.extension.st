Extension { #name : #Class }

{ #category : #'*PrefixBrowser' }
Class >> prefix [
	^ PrefixExtractor new prefixOf: self
]

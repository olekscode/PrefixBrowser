Class {
	#name : #BaselineOfPrefixBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfPrefixBrowser
}

{ #category : #baselines }
BaselineOfPrefixBrowser >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'IdentifierNameSplitter'
			with: [ spec repository: 'github://olekscode/IdentifierNameSplitter/src' ].
				
		"Packages"
		spec 
			package: 'PrefixBrowser' with: [ spec requires: #('IdentifierNameSplitter') ] ].
]

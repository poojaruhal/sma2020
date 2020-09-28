Class {
	#name : #'HE_ClassExplorer',
	#superclass : #Class,
	#instVars : [
		'projectLevel'
	],
	#category : #'Hierarchy-Analyzer-core'
}

{ #category : #converting }
HE_ClassExplorer class >> asExplorerClass: aclass [
	|hClass|
	hClass := self new.
	hClass projectLevel: 0.
	^ hClass.
]

{ #category : #testing }
HE_ClassExplorer >> isSuperclassInAnotherProject [
"superclass is from another project"
	^ ((self superclass isNil)
	or:
	[self superclass isMainObject 
			or: [(self package classes includes: self superclass) not]]).
]

{ #category : #accessing }
HE_ClassExplorer >> projectLevel [
	^ projectLevel
]

{ #category : #accessing }
HE_ClassExplorer >> projectLevel: aNumber [ 
	projectLevel := aNumber.
]

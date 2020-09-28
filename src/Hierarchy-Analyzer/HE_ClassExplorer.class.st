Class {
	#name : #'HE_ClassExplorer',
	#superclass : #Class,
	#instVars : [
		'projectLevel'
	],
	#category : #'Hierarchy-Analyzer-core'
}

{ #category : #converting }
HE_ClassExplorer class >> asExplorerClass: aClass [
	 |aExpClass|
	
	aExpClass := self newFrom: (aClass clone).
	aExpClass projectLevel: 0.
	^ aExpClass
]

{ #category : #'as yet unclassified' }
HE_ClassExplorer >> calculateProjectLevel [

	| superclassLevel |
	"superclassLevel nees to be calculated in order to calculate the project level of the class"
	superclassLevel := nil.
	self isSuperclassInAnotherPackage
		ifTrue: [ self projectLevel: 1 ]
		ifFalse: [ self projectLevel: superclassLevel + 1 ].
	^ self projectLevel
]

{ #category : #testing }
HE_ClassExplorer >> isLeafClassInPackage [

	"whether the leaf classes are in the same project or not"
 
	^ self isSuperclassInAnotherPackage not and: [ 
		  self isSubclassesInAnotherPackage ]

]

{ #category : #testing }
HE_ClassExplorer >> isOrphanClassInPackage [

	"whether the class is an orphan class or not. An Orphan class does not have superclass and subclasses in the same project"
 
	^ self isSuperclassInAnotherPackage and: [ 
		  self isSubclassesInAnotherPackage ]
]

{ #category : #testing }
HE_ClassExplorer >> isRootClassInPackage [

	"If the class is a root class or not"

	^ self isSuperclassInAnotherPackage and: [ 
		  self isSubclassesInAnotherPackage not ]
]

{ #category : #accessing }
HE_ClassExplorer >> projectLevel [
	^ projectLevel
]

{ #category : #accessing }
HE_ClassExplorer >> projectLevel: aNumber [ 
	projectLevel := aNumber.
]

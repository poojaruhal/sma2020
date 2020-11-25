Class {
	#name : #'HA_ClassExplorer',
	#superclass : #Class,
	#instVars : [
		'packageLevel'
	],
	#category : #'Hierarchy-Analyzer-core'
}

{ #category : #converting }
HA_ClassExplorer class >> asExplorerClass: aClass [
	 |aExpClass|
	
	aExpClass := self newFrom: (aClass clone).
	aExpClass packageLevel: 0.
	^ aExpClass
]

{ #category : #accessing }
HA_ClassExplorer >> calculatePackageLevel [

	| superclassLevel |
	"superclassLevel needs to be calculated in order to calculate the package level of the class"
	superclassLevel := nil.
	self isSuperclassInAnotherPackage
		ifTrue: [ self packageLevel: 1 ]
		ifFalse: [ self packageLevel: superclassLevel + 1 ].
	^ self packageLevel
]

{ #category : #testing }
HA_ClassExplorer >> isLeafClassInPackage [

	"whether the leaf classes are in the same package or not. A leaf class does not have any subclass."

	^ self isSuperclassInAnotherPackage not and: [ 
		  self isSubclassesInAnotherPackage ]
]

{ #category : #testing }
HA_ClassExplorer >> isOrphanClassInPackage [

	"Whether the class is an orphan class or not. An Orphan class does not have superclass and subclasses in the same project"

	^ self isSuperclassInAnotherPackage and: [ 
		  self isSubclassesInAnotherPackage ]
]

{ #category : #testing }
HA_ClassExplorer >> isRootClassInPackage [

	"If the class is a root class or not in the package. A root class does not have superclass in the same package but subclasses in the same package"

	^ self isSuperclassInAnotherPackage and: [ 
		  self isSubclassesInAnotherPackage not ]
]

{ #category : #accessing }
HA_ClassExplorer >> packageLevel [
	^ packageLevel
]

{ #category : #accessing }
HA_ClassExplorer >> packageLevel: aNumber [ 
	packageLevel := aNumber.
]

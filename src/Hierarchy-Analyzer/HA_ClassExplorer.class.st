"
I represent a class hierarchy explorer.

Responsibility:
I am responsible for exploring a class hierarchy in a package scope or in a project scope. I know the package level and project level of a class.

Public API and key messages:
#calculatePackageLevel  compute the hierarchy level of a class.
#asExplorerClass: aClass  I return the explorer instance of the given class. 
#isRootClassInPackage: aClass I can tell if a class is a root class in the package.

InstanceVariables
<packageLevel> package level of a class.

Usage:
explorer := HA_ClassExplorer asExplorerClass: PRExportCanvas.
explorer classDepth.
explorer calculatePackageLevel.
explorer calculateProjectLevel.

"
Class {
	#name : #'HA_ClassExplorer',
	#superclass : #Class,
	#instVars : [
		'packageLevel',
		'projectLevel'
	],
	#category : #'Hierarchy-Analyzer-core'
}

{ #category : #converting }
HA_ClassExplorer class >> asExplorerClass: aClass [
	 |aExpClass|
	
	aExpClass := self newFrom: (aClass clone).
	aExpClass packageLevel: 0.
	aExpClass projectLevel: 0.
	^ aExpClass
]

{ #category : #public }
HA_ClassExplorer >> calculatePackageLevel [

	| superclassLevel |
	"superclassLevel needs to be calculated in order to calculate the package level of the class"
	
	superclassLevel := nil.
	self isSuperclassInAnotherPackage
		ifTrue: [ self packageLevel: 1 ]
		ifFalse: [ 
		superclassLevel :=  self calculatePackageLevel: self superclass.
		self packageLevel:superclassLevel + 1 ].
	^ self packageLevel
]

{ #category : #private }
HA_ClassExplorer >> calculatePackageLevel: aClass [
	|explorer|
	"calculate the package level of the superclass"
	
	explorer := HA_ClassExplorer asExplorerClass: aClass.
	explorer isSuperclassInAnotherPackage
		ifTrue: [ explorer packageLevel: 1 ]
		ifFalse: [ 
		explorer packageLevel: (explorer calculatePackageLevel: explorer superclass) + 1 ].
	^ explorer packageLevel
]

{ #category : #public }
HA_ClassExplorer >> calculateProjectLevel [
	| superclassLevel |
	"superclassLevel needs to be calculated in order to calculate the project level of the class"
	
	superclassLevel := nil.
	self isSuperclassInAnotherProject
		ifTrue: [ self projectLevel: 1 ]
		ifFalse: [ 
		superclassLevel := self calculateProjectLevel: self superclass.
		self projectLevel: superclassLevel + 1 ].
	^ self projectLevel
]

{ #category : #private }
HA_ClassExplorer >> calculateProjectLevel: aClass [
	|explorer|
	"calculate the project level of the superclass"
	
	explorer := HA_ClassExplorer asExplorerClass: aClass.
	explorer isSuperclassInAnotherProject
		ifTrue: [ explorer projectLevel: 1 ]
		ifFalse: [ 
		explorer projectLevel: (explorer calculateProjectLevel: explorer superclass) + 1 ].
	^ explorer projectLevel
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

{ #category : #accessing }
HA_ClassExplorer >> projectLevel [
"level/depth of the class in the project"
	^ projectLevel
]

{ #category : #accessing }
HA_ClassExplorer >> projectLevel: aNumber [ 
"level/depth of the class in the project"
	projectLevel := aNumber.
]

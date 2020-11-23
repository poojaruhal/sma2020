Extension { #name : #Class }

{ #category : #'*Hierarchy-Analyzer' }
Class >> isRootObject [
	^ #(Object ProtoObject) includes: self name
]

{ #category : #'*Hierarchy-Analyzer' }
Class >> isSubclassesInAnotherPackage [

	"we don't have subclasses in the same package"

	^ self subclasses isEmpty or: [ 
		  (self subclasses select: [ :eachSubclass | 
			   self package classes includes: eachSubclass ]) isEmpty ]
]

{ #category : #'*Hierarchy-Analyzer' }
Class >> isSuperclassInAnotherPackage [

	"superclass is in another package"

	^ self superclass isNil or: [ 
		  self superclass isRootObject or: [ 
			  (self package classes includes: self superclass) not ] ]
]

Extension { #name : #Class }

{ #category : #'*Hierarchy-Analyzer' }
Class >> isRootObject [
	^ #(Object ProtoObject) includes: self name
]

{ #category : #'*Hierarchy-Analyzer' }
Class >> isSubclassesInAnotherPackage [

	"subclasses in another package"

	^ self subclasses isEmpty or: [ 
		  (self subclasses select: [ :eachSubclass | 
			   self package classes includes: eachSubclass ]) isEmpty ]
]

{ #category : #'*Hierarchy-Analyzer' }
Class >> isSubclassesInAnotherProject [

	"subclasses in another project"

	^ self subclasses isEmpty or: [ 
		  (self subclasses select: [ :eachSubclass | 
			   self project classes includes: eachSubclass ]) isEmpty ]
]

{ #category : #'*Hierarchy-Analyzer' }
Class >> isSuperclassInAnotherPackage [

	"superclass is in another package"

	^ self superclass isNil or: [ 
		  self superclass isRootObject or: [ 
			  (self package classes includes: self superclass) not ] ]
]

{ #category : #'*Hierarchy-Analyzer' }
Class >> isSuperclassInAnotherProject [

	"superclass is in another project"

	^ self superclass isNil or: [ 
		  self superclass isRootObject or: [ 
			  (self project classes includes: self superclass) not ] ]
]

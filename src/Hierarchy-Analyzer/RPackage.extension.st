Extension { #name : #RPackage }

{ #category : #'*Hierarchy-Analyzer' }
RPackage >> classesWithHierarchy [
	^ self classes
		reject: [ :eachClass | (eachClass superclass isNil or: [ eachClass superclass isMainObject 
				or: [
					"superclass is from the other project"
					(self classes includes: eachClass superclass) not
				] ])
			and: [
				"we don't have subclasses in the same project"
				(eachClass subclasses select: [ :eachSubclass | self classes includes: eachSubclass ]) isEmpty ] ]
]

{ #category : #'*Hierarchy-Analyzer' }
RPackage >> packageGroup [
 ^ (self name splitOn: '-') first
]

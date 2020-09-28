Extension { #name : #Class }

{ #category : #'*Hierarchy-Analyzer' }
Class >> isMainObject [
	^ #(Object ProtoObject) includes: self name
]

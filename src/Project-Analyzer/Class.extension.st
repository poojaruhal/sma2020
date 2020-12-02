Extension { #name : #Class }

{ #category : #'*Project-Analyzer' }
Class >> project [
^ PA_ProjectExplorer asProjectExplorer: (self  package packageGroup)
]

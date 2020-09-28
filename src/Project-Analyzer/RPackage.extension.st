Extension { #name : #RPackage }

{ #category : #'*Project-Analyzer' }
RPackage >> packageGroup [
 ^ (self name splitOn: '-') first
]

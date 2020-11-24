Class {
	#name : #BaselineOfHierarchyAnalyzer,
	#superclass : #Object,
	#category : #'BaselineOfHierachyAnalyzer-Baseline'
}

{ #category : #accessing }
BaselineOfHierarchyAnalyzer >> baseline: spec [
 <baseline>
 
 spec for: #'common' do: [
		spec 
		package: #'Project-Analyzer';
		package: #'Hierarchy-Analyzer'.
		spec group: 'default' with: #('Hierarchy-Analyzer' 'Project-Analyzer')]

]

Class {
	#name : #'PA_ProjectExplorer',
	#superclass : #Object,
	#instVars : [
		'name',
		'packages',
		'classes'
	],
	#category : #'Project-Analyzer-core'
}

{ #category : #converting }
PA_ProjectExplorer class >> asProjectExplorer: aName [

	^ self new name: aName
]

{ #category : #accessing }
PA_ProjectExplorer >> classes [
"return all the classes of the project"
	^ classes
]

{ #category : #accessing }
PA_ProjectExplorer >> name [
^ name
]

{ #category : #accessing }
PA_ProjectExplorer >> name: aName [
 name := aName.
]

{ #category : #accessing }
PA_ProjectExplorer >> packages [
	"return all the classes of the project"

	^ packages
]

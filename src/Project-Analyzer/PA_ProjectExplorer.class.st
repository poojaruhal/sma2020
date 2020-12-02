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
PA_ProjectExplorer class >> asProjectExplorer: aProjectName [
"You can explore the whole project given its name"
	^ self new name: aProjectName
]

{ #category : #accessing }
PA_ProjectExplorer >> classes [
"return all the classes of the project"
	self classes: (self packages collect: [:aPackage | aPackage classes ])flatten.
	^ classes
]

{ #category : #accessing }
PA_ProjectExplorer >> classes: projectClasses [
classes := projectClasses.
]

{ #category : #accessing }
PA_ProjectExplorer >> name [
"name of the project"
^ name
]

{ #category : #accessing }
PA_ProjectExplorer >> name: aName [
"name of the project"
 name := aName.
]

{ #category : #accessing }
PA_ProjectExplorer >> packages [

	"return all the packages of the project. A Project composed of multiple packages that start with the same name"
	self packages: (RPackageOrganizer default packages 
		select:[:aPackage | self name match: aPackage packageGroup]).
	^ packages
]

{ #category : #accessing }
PA_ProjectExplorer >> packages: aListOfPackages [

packages := aListOfPackages.
]

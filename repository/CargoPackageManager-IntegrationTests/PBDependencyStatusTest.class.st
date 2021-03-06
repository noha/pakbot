Class {
	#name : #PBDependencyStatusTest,
	#superclass : #PBAbstractTest,
	#instVars : [
		'project',
		'dependencyToProject',
		'dependencyToPackage'
	],
	#category : #'CargoPackageManager-IntegrationTests-DependencyStatus'
}

{ #category : #testing }
PBDependencyStatusTest class >> isAbstract [
	^ self = PBDependencyStatusTest 
]

{ #category : #utils }
PBDependencyStatusTest >> createProjectDependency [
	
	^ self subclassResponsibility
]

{ #category : #utils }
PBDependencyStatusTest >> installProject [
	
	self subclassResponsibility 
]

{ #category : #private }
PBDependencyStatusTest >> performTest [ 
	PBPackageRegistry 
		useDefaultRegistry: testRegistry
		during: [ self perform: testSelector asSymbol ]
]

{ #category : #running }
PBDependencyStatusTest >> setUp [
	super setUp.

	project := PBProjectVersion named: 'ATestProject'.
	testRegistry register: project.

	dependencyToProject := self createProjectDependency.

	project 
		repository: PBGitMemoryRepository new;
		importPackageNamed: #APackage;
		addDependency: dependencyToProject
]

{ #category : #tests }
PBDependencyStatusTest >> testProjectDependencyIsNotSatisfied [

	self deny: dependencyToProject isInstalled.
]

{ #category : #tests }
PBDependencyStatusTest >> testProjectDependencyIsSatisfied [

	self installProject.
	self assert: dependencyToProject isInstalled.
]

{ #category : #tests }
PBDependencyStatusTest >> testProjectIsNotUpToDate [

	self deny: project isUpToDate.
	self assert: project hasProblems.
]

{ #category : #tests }
PBDependencyStatusTest >> testProjectIsUpToDate [

	self installProject.
	self assert: project isUpToDate.
	self deny: project hasProblems.
]

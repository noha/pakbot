repository-specific
testCreateRepositoryShouldWorkOkIfDirectoryAlreadyExists

	temporaryPath asFileReference ensureCreateDirectory.
	
	CGODirectoryPackageRepository newInDirectory: temporaryPath asFileReference.
	self assert: temporaryPath asFileReference isDirectory
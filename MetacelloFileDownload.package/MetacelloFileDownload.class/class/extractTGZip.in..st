accessing
extractTGZip: aFileReference in: aFileReference2 
	
	self installTarDependencies.
	^ self shellCommand: 'tar zxvf ' , aFileReference fullName
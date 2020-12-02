accessing
extractTGZip: aFileReference in: aFileReference2 
	
	^ self shellCommand: 'tar zxvf ' , aFileReference fullName
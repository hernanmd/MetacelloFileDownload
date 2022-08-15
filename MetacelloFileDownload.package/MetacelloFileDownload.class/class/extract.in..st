accessing
extract: aFileReference in: directoryName

	| fullFilename |
	
	fullFilename := aFileReference fullName.
	self traceCr: 'Extracting file: ' , fullFilename , ' in ' , directoryName asString.
	^ (fullFilename endsWith: '.zip')
		ifTrue: [ self extractZip: aFileReference in: directoryName ]
		ifFalse: [ 
			((fullFilename endsWith: 'tgz') or: [ fullFilename endsWith: 'tar.gz' ])
				ifTrue: [ self extractTGZip: aFileReference in: directoryName  ]
				ifFalse: [ 
					(fullFilename endsWith: '.gz')
						ifTrue: [ self extractGZip: aFileReference in: directoryName ]
						ifFalse: [ self traceCr: 'File ' , aFileReference fullName , ' is not a recognized compressed type, so it is not extracted.' ] ] ].
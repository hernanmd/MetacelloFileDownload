accessing
extract: aFileReference in: directoryName

	(aFileReference fullName endsWith: '.zip')
		ifTrue: [ ^ self extractZip: aFileReference in: directoryName ]
		ifFalse: [ 
			(aFileReference fullName endsWith: 'gz')
				ifTrue: [ ^ self extractGZip: aFileReference in: directoryName ] ].
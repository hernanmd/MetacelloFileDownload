*MetacelloFileDownload
uncompress: aFileReference
    " Private - Uncompress fileRef to the current working directory "

    | dst |

	self logCr: '====== Uncompressing files...'.
	dst := FileSystem workingDirectory.
	(aFileReference fullName endsWith: '.zip')
		ifTrue: [ ^ self extractZip: aFileReference in: dst ]
		ifFalse: [ 
			(aFileReference fullName endsWith: '.gz')
				ifTrue: [ ^ self extractGZip: aFileReference in: dst ] ].
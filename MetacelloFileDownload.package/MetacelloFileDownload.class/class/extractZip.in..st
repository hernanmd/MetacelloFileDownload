accessing
extractZip: aFileReference in: directoryName
    " If aFileReference is a ZIP archive, uncompress its contents in dst and delete it "

    | zipArchive |

    zipArchive := ZipArchive new.
    [ zipArchive
        readFrom: aFileReference fullName;
        extractAllTo: directoryName ]
	ensure: [ zipArchive close ].
	self traceCr: 'Deleting compressed zip: ' , aFileReference fullName.
	aFileReference delete
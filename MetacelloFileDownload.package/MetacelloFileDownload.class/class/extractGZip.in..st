accessing
extractGZip: aFileReference in: directoryName
	" Untar and extract aFileReference in dst folder "
	| unZipped |

	unZipped := GZipReadStream unzip: aFileReference basename to: directoryName.
	self unTar: unZipped.
	aFileReference delete.
	unZipped asFileReference delete
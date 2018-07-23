*MetacelloFileDownload
extractGZip: aFileReference in: dst
	" Untar and extract aFileReference in dst folder "
	| unZipped |

	unZipped := GZipReadStream unzip: aFileReference basename to: dst.
	self unTar: unZipped.
	aFileReference delete.
	unZipped asFileReference delete
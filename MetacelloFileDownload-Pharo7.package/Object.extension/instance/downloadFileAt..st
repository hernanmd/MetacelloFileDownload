*MetacelloFileDownload-Pharo7
downloadFileAt: urlIndex
	" Answer a <FileReference> matching the urlIndex of receiver's platformFilesUrl "

	| url fileRef |
	url := (self platformFilesUrl at: urlIndex) asZnUrl.
	self traceCr: 'Downloading file at: ' , url asString.
	fileRef := FileSystem disk workingDirectory / url pathSegments last.	
	self downloadResourcesFrom: url.
	^ fileRef
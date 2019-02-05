*MetacelloFileDownload-Pharo6
downloadFileAt: urlIndex
	" Answer a <FileReference> matching the urlIndex of receiver's platformFilesUrl "

	| url fileRef response |
	url := (self platformFilesUrl at: urlIndex) asZnUrl.
	fileRef := FileSystem disk workingDirectory / url pathSegments last.	
	(response :=self downloadResourcesFrom: url) isSuccess 
		ifTrue: [ fileRef writeStreamDo: [ : stream | stream nextPutAll: response contents ] ]
		ifFalse: [ self error: 'Cannot download resource files' ].
	^ fileRef
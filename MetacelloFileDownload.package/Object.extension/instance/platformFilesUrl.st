*MetacelloFileDownload
platformFilesUrl
	" Answer a <Collection> of download URLs for the current platform "

"	^ Smalltalk os isWin32 
		ifTrue: [ #(
			'https://github.com/....file1.zip'
			'http://www.dropbox.com/file1.zip' ) ]
		ifFalse: [ #(
			'https://github.com/....file1.tar.gz'
			'http://www.dropbox.com/file1.tar.gz') ].
		
	^ String streamContents: [ : stream |
		stream 
			nextPutAll: 'https://github.com/yourGHUser/yourProject/raw/master/res/';
			nextPutAll: (Smalltalk os isWin32 
						ifTrue: [ 'file1.zip' ]
						ifFalse: [ 'file1.tar.gz' ]) ] "
		
	self subclassResponsibility
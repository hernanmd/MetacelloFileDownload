*MetacelloFileDownload-Pharo7
downloadResourcesFrom: urlString
	" Private - Download files from urlString "

	| webClient |
	webClient := ZnClient new.
	UIManager default informUserDuring: [ :bar | 
		bar label: 'Downloading resources for ' , self class printString.
		[ webClient
			signalProgress: true;
			maximumEntitySize: 1073741824;
			url: urlString;
			downloadTo: FileSystem workingDirectory ]
		on: HTTPProgress
		do: [ : ex | self handleEx: bar progress: ex ] ]
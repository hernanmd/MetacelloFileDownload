*MetacelloFileDownload
downloadResourcesFrom: urlString
	" Private - Download files from urlString "

	| webClient |
	webClient := ZnClient new.
	UIManager default informUserDuring: [ :bar | 
		bar label: 'Downloading resources for ' , self class printString.
		[ webClient
			signalProgress: true;
			get: urlString ]
		on: HTTPProgress , ZnEntityTooLarge
		do: [ : ex | self handleEx: bar progress: ex ] ].
	^ webClient

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
		on: HTTPProgress, ZnEntityTooLarge
		do: [ : ex |
			(ex isKindOf: (Smalltalk at: #ZnEntityTooLarge))
				ifTrue:[ ex resume ]
				ifFalse: [ | progress |
					progress := ex.
					progress isEmpty ifFalse: [ 
						bar current: progress percentage.
						progress total ifNotNil: [ :aTotalNumber |
							bar label: 'Downloading ' ] ].
					progress resume ] ] ].
	^ webClient

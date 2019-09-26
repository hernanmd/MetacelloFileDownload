*MetacelloFileDownload-Pharo7
mfdHandleProgressEx: ex progress: bar

	| progress |
	progress := ex.
	progress isEmpty
		ifFalse: [
			bar current: progress percentage.
			progress total ifNotNil: [ : aTotalNumber | bar label: 'Downloading ' ] ].
	progress resume.

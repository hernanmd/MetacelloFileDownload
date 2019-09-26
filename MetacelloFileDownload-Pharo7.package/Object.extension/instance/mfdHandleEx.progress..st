*MetacelloFileDownload-Pharo7
mfdHandleEx: ex progress: bar

	(ex isKindOf: HTTPProgress )
		ifTrue: [ self mfdHandleProgressEx: ex progress: bar ]
		ifFalse: [ ex mfdHandleEx ]
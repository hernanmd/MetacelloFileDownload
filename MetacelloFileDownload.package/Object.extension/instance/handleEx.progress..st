*MetacelloFileDownload
handleEx: bar progress: ex

	^ (ex isKindOf: (Smalltalk at: #ZnEntityTooLarge))
		ifTrue: [ ex resume ]
		ifFalse: [ 
			| progress |
			progress := ex.
			progress isEmpty
				ifFalse: [
					bar current: progress percentage.
					progress total
						ifNotNil: [ :aTotalNumber | bar label: 'Downloading ' ] ].
			progress resume ]
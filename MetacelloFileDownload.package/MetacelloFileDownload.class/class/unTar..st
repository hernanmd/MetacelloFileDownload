accessing
unTar: fileName
	" Older Pharo images does not support OSSubProcess and should use OSProcess. "

	self installTarDependencies.
	(Smalltalk image version beginsWithAnyOf: #('Pharo7' 'Pharo8' 'Pharo9' 'Pharo10'))
		ifTrue: [ self unTarOSSubProcess: fileName asFileReference ]
		ifFalse: [ self unTarOSProcess: fileName asFileReference ].
accessing
unTar: fileName

	(Smalltalk image version beginsWith: 'Pharo7')
		ifTrue: [ 
			self installOSSubProcess.
			self unTarOSSubProcess: fileName asFileReference ]
		ifFalse: [ 
			self installOSProcess.
			self unTarOSProcess: fileName asFileReference ].	

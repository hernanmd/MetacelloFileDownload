accessing
installTarDependencies

	(Smalltalk image version beginsWithAnyOf: #('Pharo7' 'Pharo8' 'Pharo9'))
		ifTrue: [	self installOSSubProcess ]
		ifFalse: [ self installOSProcess ].	
accessing
installTarDependencies

	(Smalltalk image version beginsWithAnyOf: #('Pharo7' 'Pharo8' 'Pharo9' 'Pharo10' 'Pharo11' 'Pharo12' 'Pharo13'))
		ifTrue: [	self installOSSubProcess ]
		ifFalse: [ self installOSProcess ].	
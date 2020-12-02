accessing
unTarOSSubProcess: aFileReference

	^ self shellCommand: 'tar xvf ' , aFileReference fullName

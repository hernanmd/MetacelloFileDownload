accessing
unTar: fileName

	(Smalltalk hasClassNamed: #OSProcess)
		ifFalse: [ self installOSProcess ].			
	[ (Smalltalk at: #OSProcess) thisOSProcess 
			waitForCommandOutput: 'tar xvf ' , fileName asFileReference fullName ]
   on: Warning " AioEventHandler aioPluginPresent "
   do: [ : ex | ex resume ]
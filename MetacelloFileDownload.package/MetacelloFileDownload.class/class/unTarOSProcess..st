accessing
unTarOSProcess: aFileReference

	[ 
		(Smalltalk at: #OSProcess) thisOSProcess 
			waitForCommandOutput: 'tar xvf ' , aFileReference fullName 
	]
   on: Warning " AioEventHandler aioPluginPresent "
   do: [ : ex | ex resume ]

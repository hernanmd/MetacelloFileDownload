*MetacelloFileDownload
platformFileDownload: urlIndex

	^ [ MetacelloFileDownload 
			extract: (self downloadFileAt: urlIndex) 
			in: FileSystem workingDirectory ]
		on: ZdcPluginMissing
		do: [ :ex | ex retry ]
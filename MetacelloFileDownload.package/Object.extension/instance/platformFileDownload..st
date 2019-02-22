*MetacelloFileDownload
platformFileDownload: urlIndex

	^ [ MetacelloFileDownload 
			extract: (self downloadFileAt: urlIndex) fullName 
			in: FileSystem workingDirectory ]
		on: ZdcPluginMissing
		do: [ :ex | ex retry ]
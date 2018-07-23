*MetacelloFileDownload
platformFileDownload: urlIndex

	^ [ self uncompress: (self downloadFileAt: urlIndex) ]
		on: ZdcPluginMissing
		do: [ :ex | ex retry ]
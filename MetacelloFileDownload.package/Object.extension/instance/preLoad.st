*MetacelloFileDownload
preLoad
	" Start downloading configuration/baseline resource files "

	self logCr: '====== Downloading my resource files...'.
	(1 to: self platformFilesUrl size)
		do: [ : urlIndex | 
			[ self uncompress: (self downloadFileAt: urlIndex) ]
			on: ZdcPluginMissing
			do: [ : ex | ex retry ] ]
		displayingProgress: 'Downloading resource files...'.
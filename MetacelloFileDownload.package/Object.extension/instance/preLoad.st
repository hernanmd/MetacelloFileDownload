*MetacelloFileDownload
preLoad
	" Start downloading configuration/baseline resource files "

	self traceCr: '====== Downloading my resource files...'.
	(1 to: self platformFilesUrl size)
		do: [ :urlIndex | self platformFileDownload: urlIndex ]
		displayingProgress: 'Downloading resource files...'
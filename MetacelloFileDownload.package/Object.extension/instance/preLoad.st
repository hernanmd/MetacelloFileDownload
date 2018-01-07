*MetacelloFileDownload
preLoad
	" Start downloading configuration/baseline resource files "

	| urlIndex |

	urlIndex := 1.
	self logCr: '====== Downloading my resource files...'.
	[ self uncompress: (self downloadFileAt: urlIndex) ]
	on: ZdcPluginMissing
	do: [ : ex | 
		urlIndex := urlIndex + 1.
		ex retry ].


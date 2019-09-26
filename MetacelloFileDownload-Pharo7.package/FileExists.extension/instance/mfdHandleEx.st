*MetacelloFileDownload-Pharo7
mfdHandleEx
	" Handle existing file by deleting the old version and retry "

	ZnFileSystemUtils deleteIfExists: self reference.
	self retry.
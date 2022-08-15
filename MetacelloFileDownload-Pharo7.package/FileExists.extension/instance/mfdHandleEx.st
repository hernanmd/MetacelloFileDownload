*MetacelloFileDownload-Pharo7
mfdHandleEx
	" Handle existing file by deleting the old version and retry "

	self traceCr: 'File exists, deleting...'.
	ZnFileSystemUtils deleteIfExists: self reference.
	self retry.
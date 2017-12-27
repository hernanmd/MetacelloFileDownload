*MetacelloFileDownload
uncompress: aFileReference
    " Private - Uncompress fileRef to the current working directory "

    | dst |
    dst := FileSystem workingDirectory.
    self extractZip: aFileReference in: dst.
    self extractGZip: aFileReference in: dst.
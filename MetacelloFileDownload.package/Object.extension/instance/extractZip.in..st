*MetacelloFileDownload
extractZip: aFileReference in: dst
    " If aFileReference is a ZIP archive, uncompress its contents in dst and delete it "

    | zipArchive |

    zipArchive := ZipArchive new.
    [ zipArchive
        readFrom: aFileReference fullName;
        extractAllTo: dst ]
        ensure: [ zipArchive close ].
    aFileReference delete
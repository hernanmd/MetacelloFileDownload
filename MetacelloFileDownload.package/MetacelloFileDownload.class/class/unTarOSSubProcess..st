accessing
unTarOSSubProcess: aFileReference

	(Smalltalk at: #OSSUnixSubprocess) new
		command: '/bin/tar';
		arguments: { 'xvf' . aFileReference fullName };
		redirectStdout;
		runAndWait

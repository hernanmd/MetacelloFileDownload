accessing
unTarOSSubProcess: aFileReference

	(Smalltalk at: #OSSUnixSubprocess) new
		command: '/bin/tar';
		arguments: { 'xvf' . aFileReference fullName };
		redirectStderr;
		redirectStdout;
		runAndWaitOnExitDo: [ :command :outString :errString |
			Transcript show: errString; cr; show: outString.
		].

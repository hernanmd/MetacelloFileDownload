accessing
shellCommand: aShellCommand
	| command |

	command := OSSUnixSubprocess new
		shellCommand: aShellCommand;
		redirectStdout;
		redirectStderr;
	    runAndWaitOnExitDo: [ :process :outString :errString  |
	        errString inspect.
	        outString inspect ].
	command closeAndCleanStreams.

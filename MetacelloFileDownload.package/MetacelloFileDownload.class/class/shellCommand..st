accessing
shellCommand: aShellCommand
	| command |

	command := (Smalltalk at: #OSSUnixSubprocess) new
		shellCommand: aShellCommand;
		redirectStdout;
		redirectStderr;
	    runAndWaitOnExitDo: [ :process :outString :errString  |
	        errString inspect.
	        outString inspect ].
	command closeAndCleanStreams.

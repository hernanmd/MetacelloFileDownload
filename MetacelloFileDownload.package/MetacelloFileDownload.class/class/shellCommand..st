accessing
shellCommand: aShellCommand
	| command |
	command := (Smalltalk shortImageName asLowercase beginsWith: 'glam')
			ifTrue: [ GtSubprocessWithInMemoryOutput new
					shellCommand: aShellCommand;
					runAndWait ]
			ifFalse: [ (Smalltalk at: #OSSUnixSubprocess) new
					shellCommand: aShellCommand;
					redirectStdout;
					redirectStderr;
					runAndWaitOnExitDo: [ :process :outString :errString | 
						errString traceCr.
						outString traceCr ] ].
	command closeAndCleanStreams
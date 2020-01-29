accessing
installOSSubProcess
	" As documented in https://github.com/pharo-contributions/OSSubProcess#installation "

	Metacello new
	 	baseline: 'OSSubprocess';
	 	repository: 'github://pharo-contributions/OSSubprocess:master/repository';
		load.
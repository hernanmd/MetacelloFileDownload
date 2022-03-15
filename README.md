# Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Resources](#resources)
  - [If you have one resource file for all OS(es)](#if-you-have-one-resource-file-for-all-os)
  - [If you have one URL for your resource file for multiple OS(es)](#if-you-have-one-url-for-your-resource-file-for-multiple-os)
  - [If you have mirror URL's for your resource file](#if-you-have-mirror-urls-for-your-resource-file)
- [License](#license)

# Description

Add helper methods to download resources in Baseline or Metacello Configurations in Pharo Smalltalk. The files that you specify will be downloaded and uncompressed without need to write any code.

# Installation

Note: You do not need to install it in your Pharo image unless you want to make modifications to this package. See the [Usage](#usage) section below.

```smalltalk
EpMonitor disableDuring: [ 
	Metacello new
		baseline: 'MetacelloFileDownload';
		repository: 'github://hernanmd/MetacelloFileDownload';
		load ]
```

# Usage

- You can upload your files anywhere you want.
- All your files must be already uploaded in .zip or .tar.gz
- .zip or .tar.gz files will be downloaded and uncompressed in the ```FileSystem workingDirectory``` (check if you have write permissions first).
- You can add several (mirror) URL's for the same resource file (see examples below).

Add the following line in the #baseline method of your Configuration/BaselineOf class:

```smalltalk
	"... configuration code ... "
	spec preLoadDoIt: #preLoad.
	"... configuration code ... "
```

To enable bootstrapping add the following two methods to your Configuration/Baseline (instance side)

```smalltalk
ensureMetacelloFileDownload
	EpMonitor disableDuring: [
		Metacello new
			baseline: 'MetacelloFileDownload';
			onWarningLog;
			repository: 'github://hernanmd/MetacelloFileDownload';
			load ]
```

Add the #preLoad method (instance side) in your BaselineOf/ConfigurationOf class:

```smalltalk
preLoad
    self ensureMetacelloFileDownload.
    super preLoad.
```

## Resources

Finally, in your ConfigurationOf/BaselineOf class (instance side), add a method with selector #platformFilesUrl answering a Collection of download URL's. 

### If you have one resource file for all OS

 Assuming you have uploaded your resource files named "file1.zip" and file1.tar.gz to a "res" directory in your repository:
 
```smalltalk
platformFilesUrl

	^ Array with: 'https://github.com/yourGHUser/yourProject/raw/master/res/file1.zip' ]
```

### If you have one URL for your resource file for multiple OS
 
 Assuming you have uploaded your resource files named "file1.zip" and file1.tar.gz to a "res" directory:
 (don't forget the last / before the last URL fragment)

```smalltalk
platformFilesUrl

	^ Array with: (String streamContents: [ : stream |		
		stream 			
			nextPutAll: 'https://github.com/yourGHUser/yourProject/raw/master/res/';
			nextPutAll: (
				Smalltalk os isWin32 					
					ifTrue: [ 'file1.zip' ]
					ifFalse: [ 'file1.tar.gz' ]) ])
```


### If you have mirror URLs for your resource file

The same as above, specify the raw URL to your resource files

```smalltalk
platformFilesUrl

	^ Smalltalk os isWin32 		
			ifTrue: [ #(
				'https://github.com/..../file1.zip'
				'http://www.dropbox.com/file1.zip' ) ]
			ifFalse: [ #(
				'https://github.com/..../file1.tar.gz'
				'http://www.dropbox.com/file1.tar.gz') ].
```

That's all. Try your Configuration or Baseline script!

# License

This software is licensed under the MIT License.

Copyright Hernán Morales, 2018-2022.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

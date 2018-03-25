# MetacelloFileDownload

Add helper methods to download resources in Baseline or Metacello Configurations in Pharo Smalltalk. The files that you specify will be downloaded and uncompressed without need to write any code.

# Installation

```smalltalk
Metacello new
	baseline: 'MetacelloFileDownload';
	repository: 'github://hernanmd/MetacelloFileDownload';
	load.
```

# Rules of the game

- You can upload your files anywhere you want.
- All your files must be already uploaded in .zip or .tar.gz
- If you use Windows, .zip files will be downloaded and uncompressed in the #workingDirectory.
- If you use Unix/MacOS, .tar.gz files will be downloaded and uncompressed in the #workingDirectory.
- You can add several (mirror) URL's for the same resource file (see Example below).

# Usage

- Add the following line in the #baseline method of your Configuration/Baseline:

```smalltalk
"... configuration code ... "
spec preLoadDoIt: #preLoad.
"... configuration code ... "
```

To enable bootstrapping add the following two methods to your Configuration/Baseline (instance side)

```smalltalk
ensureMetacelloFileDownload     
  Metacello new           
    baseline: 'MetacelloFileDownload';              
    repository: 'github://hernanmd/MetacelloFileDownload';          
    load.
```

Add the #preLoad method:

```smalltalk
preLoad
    self ensureMetacelloFileDownload.
    super preLoad.
```

- In your Configuration class (instance side), add a method with selector #platformFilesUrl answering a Collection of download URL's. Examples:
  - If you have mirror URL's for your resource file:
```smalltalk
^ Smalltalk os isWin32 		
    ifTrue: [ #(
        'https://github.com/....file1.zip'
	'http://www.dropbox.com/file1.zip' ) ]
     ifFalse: [ #(
	'https://github.com/....file1.tar.gz'
	'http://www.dropbox.com/file1.tar.gz') ].
```
    - If you have one URL for your resource file: (don't forget the last / before the last URL fragment)
```smalltalk
^ Array with: (String streamContents: [ : stream |		
    stream 			
       nextPutAll: 'https://github.com/yourGHUser/yourProject/raw/master/res/';
       nextPutAll: (
           Smalltalk os isWin32 					
	       ifTrue: [ 'file1.zip' ]
	       ifFalse: [ 'file1.tar.gz' ]) ])
```
- That's all. Try your Configuration or Baseline script!

# License

This software is licensed under the MIT License.

Copyright Hernán Morales, 2018.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

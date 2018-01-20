# MetacelloFileDownload
Add helper methods to download resources in Baseline or Metacello Configurations (Pharo Smalltalk)

# Installation

```smalltalk
Metacello new
	baseline: 'MetacelloFileDownload';
	repository: 'github://hernanmd/MetacelloFileDownload';
	load.
```

# Usage

- All your files must be already uploaded in .zip or .tar.gz
- If you use Windows, .zip files will be downloaded and decompressed in the #workingDirectory.. If you use Unix/MacOS, .tar.gz files will be downloaded and decompressed in the #workingDirectory.
- You can add several files at different URL locations in a method (see Example below).
- Add the following line in the #baseline method of your Configuration:

```smalltalk
"... configuration code ... "
spec preLoadDoIt: #preLoad.
"... configuration code ... "
```

To enable bootstrapping add the following two methods to your Configuration (instance side)

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
--If you have mirror URL's for your resource file:
```smalltalk
^ Smalltalk os isWin32 		
    ifTrue: [ #(
        'https://github.com/....file1.zip'
	'http://www.dropbox.com/file1.zip' ) ]
     ifFalse: [ #(
	'https://github.com/....file1.tar.gz'
	'http://www.dropbox.com/file1.tar.gz') ].
```

--If you have one URL for your resource file: (don't forget the last / before the last URL fragment)
```smalltalk
^ Array with: (String streamContents: [ : stream |		
    stream 			
       nextPutAll: 'https://github.com/yourGHUser/yourProject/raw/master/res/';
       nextPutAll: (
           Smalltalk os isWin32 					
	       ifTrue: [ 'file1.zip' ]
	       ifFalse: [ 'file1.tar.gz' ]) ])
```
- That's all. Try your Configuration script!

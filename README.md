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

- Add the following line in the #baseline method of your Configuration:

```smalltalk
spec preLoadDoIt: #preLoad.
```

To enable bootstrapping add the following two methods to your Configuration (instance side)

```smalltalk
ensureMetacelloFileDownload     
  Metacello new           
    baseline: 'MetacelloFileDownload';              
    repository: 'github://hernanmd/MetacelloFileDownload';          
    load.
```

```smalltalk
preLoad
    self ensureMetacelloFileDownload.
    super preLoad.
```

- In your Configuration class (instance side), add a method with selector #platformFilesUrl answering a Collection of download URL's. Examples:

```smalltalk
^ Smalltalk os isWin32 		
    ifTrue: [ #(
        'https://github.com/....file1.zip'
	'http://www.dropbox.com/file1.zip' ) ]
     ifFalse: [ #(
	'https://github.com/....file1.tar.gz'
	'http://www.dropbox.com/file1.tar.gz') ].
```

```smalltalk
^ String streamContents: [ : stream |		
    stream 			
       nextPutAll: 'https://github.com/yourGHUser/yourProject/raw/master/res/';
       nextPutAll: (
           Smalltalk os isWin32 					
	       ifTrue: [ 'file1.zip' ]
	       ifFalse: [ 'file1.tar.gz' ]) ]
```


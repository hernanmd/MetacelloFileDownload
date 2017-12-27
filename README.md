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

- Add the following line in your #baseline method:

```smalltalk
spec preLoadDoIt: #preLoad.
```
- Add a method with selector #platformFilesUrl answering a <Collection> of download URL's. See Object superimplementor for an example.

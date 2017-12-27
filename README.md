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
- In your Configuration class (instance side), add a method with selector #platformFilesUrl answering a <Collection> of download URL's. See Object superimplementor for an example.

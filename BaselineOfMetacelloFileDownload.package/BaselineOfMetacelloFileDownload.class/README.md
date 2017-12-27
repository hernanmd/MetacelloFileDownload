Facilitate downloading resources from Baseline's or Metacello Configurations.

To use it follow these steps:

1) Add a line in your #baseline method:

spec preLoadDoIt: #preLoad.

2) Add a method with selector #platformFilesUrl answering a <Collection> of download URL's. See Object superimplementor for example.




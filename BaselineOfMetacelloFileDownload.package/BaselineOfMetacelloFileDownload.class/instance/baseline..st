baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec package: 'MetacelloFileDownload'.
			spec group: 'Core' with: #('MetacelloFileDownload').
			spec group: 'default' with: #('Core') ]

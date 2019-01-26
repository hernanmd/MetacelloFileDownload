baseline
baseline: spec
	<baseline>

	spec
		for: #common
		do: [ 
			spec package: 'MetacelloFileDownload'.
			spec group: 'Core' with: #('MetacelloFileDownload').
			spec group: 'default' with: #('Core') ].

	spec for: #'pharo6.x' do: [ 
		spec package: 'MetacelloFileDownload' with: [ 
			spec requires: 'MetacelloFileDownload-Pharo6' ].
		spec package: 'MetacelloFileDownload-Pharo6' ].
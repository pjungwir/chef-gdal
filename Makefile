publish:
	rm -f README.html
	cd ~/src/cookbooks && knife cookbook -k ~/share/chef/pjungwir.pem site share gdal Databases -o . 



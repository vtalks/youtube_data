VERSION=`cat VERSION`

install:	## Install package
	python3 -m pip install --index-url https://upload.pypi.org/legacy/ youtube_data_api3

# Clean

clean:		## Clean intermediate project files
	rm -rf build dist *.egg-info .cover*

# Test

.PHONY: test
test:		## Execute tests suites
	python3 -m unittest discover -v

.PHONY: cover
cover:		## Generate coverage information
	coverage3 run --omit=*.venv*,setup.py --source=./youtube_data_api3 -m unittest discover
	coverage3 report --omit=*.venv*,setup.py

.PHONY: coverage-html
coverage-html:	cover
coverage-html:	## Generate coverage HTML report
	coverage3 html --directory=.cover --omit=*.venv*,setup.py

.PHONY: codecov
codecov:	## Generate codecov.io coverage report
	codecov

.PHONY: dist
dist:		## Generate distribution packages
	python3 setup.py sdist bdist_wheel

dist-publish:	## Publish package to pypi.org
	twine upload --repository-url https://upload.pypi.org/legacy/ dist/*

include Makefile.help.mk

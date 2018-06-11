VERSION=`cat VERSION`

# Test

.PHONY: test
test:	## Execute tests suites
	python3 -m unittest discover -v


.PHONY: cover
cover:	## Generate coverage information
	coverage3 run --omit=*.venv*,main.py --source=. -m unittest discover

.PHONY: coverage-html
coverage-html:	cover ## HTML report
	coverage3 html --directory=.cover --omit=*.venv*,main.py

.PHONY: coveralls
coveralls:	## Coverage to coveralls report
	coveralls --data_file=.coverage --coveralls_yaml=.coveralls.yml --base_dir=.

include Makefile.help.mk
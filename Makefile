SHELL := /bin/bash
setup:
	# Create python virtualenv & source it
	#python3.7 -m venv ~/.devops
	source ./.devops/bin/activate

install:
	# This should be run from inside a virtualenv
	# pip install --upgrade pip &&\
	pip install --user -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint --ignore=DL3013 Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1309,E0401 app.py

all: install lint

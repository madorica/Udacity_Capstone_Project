SHELL := /bin/bash
setup:
	# Create python virtualenv & source it
	#python3.7 -m venv ~/.devops
	source ./.devops/bin/activate

install:
	pip install -r requirements.txt

test:
	pip install pytest
	pip install requests
	pytest test.py

lint:
	hadolint --ignore=DL3013 Dockerfile
	pylint --disable=R,C,W1203,W1309,E0401 app.py

all-for-lint: setup install lint
all-for-test: setup install test

SHELL := /bin/bash
setup:
	# Create python virtualenv & source it
	python3.7 -m venv ~/.devops
	#source ./.devops/bin/activate

install:
	pip install -r requirements.txt


lint:
	hadolint --ignore=DL3013 Dockerfile
	pylint --disable=R,C,W1203,W1309,E0401 app.py

all: setup install lint

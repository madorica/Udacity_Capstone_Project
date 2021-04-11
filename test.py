# test.py
import pytest
import requests

@pytest.fixture
def my_url():
	return "http://localhost:8000"

def test_url(my_url):
	url = my_url + "/"
	print(url)
	response = requests.get(url)
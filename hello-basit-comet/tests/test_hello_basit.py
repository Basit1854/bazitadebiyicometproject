import pytest
import os, sys

sys.path.append(os.path.abspath("./src"))  # Adjust path to include src 

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

from src.app import app
def test_404(client):
    """Test a non-existent route returns 404."""
    response = client.get('/foobar')
    assert response.status_code == 404
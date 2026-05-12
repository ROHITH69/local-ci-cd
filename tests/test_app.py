from app.app import app

client = app.test_client()


def test_home():
    response = client.get("/")

    assert response.status_code == 200


def test_health():
    response = client.get("/health")

    assert response.status_code == 200


def test_invalid_route():
    response = client.get("/invalid")

    assert response.status_code == 404


def test_home_content():
    response = client.get("/")

    data = response.get_json()

    assert data["message"] == "Local CI/CD Pipeline Running Successfully"

from health import check_health

def test_health_check():
    response = check_health()
    assert response.status_code == 200
import sys
import logging
import requests

logging.basicConfig(level=logging.INFO)

URL = "http://127.0.0.1:5000/"

try:
    response = requests.get(URL, timeout=5)

    if response.status_code == 200:
        logging.info("Atlas health check passed")
        sys.exit(0)
    else:
        logging.error(
            "Atlas health check failed: HTTP %s",
            response.status_code
        )
        sys.exit(1)

except requests.RequestException as error:
    logging.error("Atlas health check failed: %s", error)
    sys.exit(1)
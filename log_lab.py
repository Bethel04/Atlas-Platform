import logging

logging.basicConfig(level=logging.INFO)

logging.debug("Checking Atlas")
logging.info("Atlas health check started")
logging.warning("Atlas is slow")
logging.error("Atlas failed")
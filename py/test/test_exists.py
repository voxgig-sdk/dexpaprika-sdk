# Dexpaprika SDK exists test

import pytest
from dexpaprika_sdk import DexpaprikaSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = DexpaprikaSDK.test(None, None)
        assert testsdk is not None

# Dexpaprika SDK feature factory

from dexpaprika_sdk.feature.base_feature import DexpaprikaBaseFeature
from dexpaprika_sdk.feature.test_feature import DexpaprikaTestFeature


def _make_feature(name):
    features = {
        "base": lambda: DexpaprikaBaseFeature(),
        "test": lambda: DexpaprikaTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()

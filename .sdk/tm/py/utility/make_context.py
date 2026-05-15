# Dexpaprika SDK utility: make_context

from core.context import DexpaprikaContext


def make_context_util(ctxmap, basectx):
    return DexpaprikaContext(ctxmap, basectx)

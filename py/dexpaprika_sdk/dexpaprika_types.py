# Typed models for the Dexpaprika SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Exchange(TypedDict, total=False):
    chain: str
    id: str
    liquidity_usd: float
    name: str
    trades_24h: int
    volume_24h: float


class ExchangeListMatch(TypedDict, total=False):
    chain: str
    id: str
    liquidity_usd: float
    name: str
    trades_24h: int
    volume_24h: float


class Historical(TypedDict, total=False):
    data: list
    token_id: str


class HistoricalLoadMatch(TypedDict):
    id: str


class Pool(TypedDict, total=False):
    address: str
    apr: float
    chain: str
    dex: str
    id: str
    liquidity_usd: float
    token0: dict
    token1: dict
    volume_24h: float


class PoolListMatch(TypedDict, total=False):
    address: str
    apr: float
    chain: str
    dex: str
    id: str
    liquidity_usd: float
    token0: dict
    token1: dict
    volume_24h: float


class Ticker(TypedDict, total=False):
    price_change_24h: float
    price_usd: float
    symbol: str
    timestamp: str
    volume_24h: float


class TickerListMatch(TypedDict, total=False):
    price_change_24h: float
    price_usd: float
    symbol: str
    timestamp: str
    volume_24h: float


class Token(TypedDict, total=False):
    address: str
    chain: str
    decimals: int
    id: str
    last_updated: str
    liquidity_usd: float
    market_cap: float
    name: str
    price_change_24h: float
    price_usd: float
    symbol: str
    total_supply: float
    volume_24h: float


class TokenLoadMatch(TypedDict):
    id: str


class TokenListMatch(TypedDict, total=False):
    address: str
    chain: str
    decimals: int
    id: str
    last_updated: str
    liquidity_usd: float
    market_cap: float
    name: str
    price_change_24h: float
    price_usd: float
    symbol: str
    total_supply: float
    volume_24h: float

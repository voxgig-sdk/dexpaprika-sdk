# Typed models for the Dexpaprika SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Exchange:
    chain: Optional[str] = None
    id: Optional[str] = None
    liquidity_usd: Optional[float] = None
    name: Optional[str] = None
    trades_24h: Optional[int] = None
    volume_24h: Optional[float] = None


@dataclass
class ExchangeListMatch:
    chain: Optional[str] = None
    id: Optional[str] = None
    liquidity_usd: Optional[float] = None
    name: Optional[str] = None
    trades_24h: Optional[int] = None
    volume_24h: Optional[float] = None


@dataclass
class Historical:
    data: Optional[list] = None
    token_id: Optional[str] = None


@dataclass
class HistoricalLoadMatch:
    id: str


@dataclass
class Pool:
    address: Optional[str] = None
    apr: Optional[float] = None
    chain: Optional[str] = None
    dex: Optional[str] = None
    id: Optional[str] = None
    liquidity_usd: Optional[float] = None
    token0: Optional[dict] = None
    token1: Optional[dict] = None
    volume_24h: Optional[float] = None


@dataclass
class PoolListMatch:
    address: Optional[str] = None
    apr: Optional[float] = None
    chain: Optional[str] = None
    dex: Optional[str] = None
    id: Optional[str] = None
    liquidity_usd: Optional[float] = None
    token0: Optional[dict] = None
    token1: Optional[dict] = None
    volume_24h: Optional[float] = None


@dataclass
class Ticker:
    price_change_24h: Optional[float] = None
    price_usd: Optional[float] = None
    symbol: Optional[str] = None
    timestamp: Optional[str] = None
    volume_24h: Optional[float] = None


@dataclass
class TickerListMatch:
    price_change_24h: Optional[float] = None
    price_usd: Optional[float] = None
    symbol: Optional[str] = None
    timestamp: Optional[str] = None
    volume_24h: Optional[float] = None


@dataclass
class Token:
    address: Optional[str] = None
    chain: Optional[str] = None
    decimal: Optional[int] = None
    id: Optional[str] = None
    last_updated: Optional[str] = None
    liquidity_usd: Optional[float] = None
    market_cap: Optional[float] = None
    name: Optional[str] = None
    price_change_24h: Optional[float] = None
    price_usd: Optional[float] = None
    symbol: Optional[str] = None
    total_supply: Optional[float] = None
    volume_24h: Optional[float] = None


@dataclass
class TokenLoadMatch:
    id: str


@dataclass
class TokenListMatch:
    address: Optional[str] = None
    chain: Optional[str] = None
    decimal: Optional[int] = None
    id: Optional[str] = None
    last_updated: Optional[str] = None
    liquidity_usd: Optional[float] = None
    market_cap: Optional[float] = None
    name: Optional[str] = None
    price_change_24h: Optional[float] = None
    price_usd: Optional[float] = None
    symbol: Optional[str] = None
    total_supply: Optional[float] = None
    volume_24h: Optional[float] = None


<?php
declare(strict_types=1);

// Typed models for the Dexpaprika SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Exchange entity data model. */
class Exchange
{
    public ?string $chain = null;
    public ?string $id = null;
    public ?float $liquidity_usd = null;
    public ?string $name = null;
    public ?int $trades_24h = null;
    public ?float $volume_24h = null;
}

/** Request payload for Exchange#list. */
class ExchangeListMatch
{
    public ?string $chain = null;
    public ?string $id = null;
    public ?float $liquidity_usd = null;
    public ?string $name = null;
    public ?int $trades_24h = null;
    public ?float $volume_24h = null;
}

/** Historical entity data model. */
class Historical
{
    public ?array $data = null;
    public ?string $token_id = null;
}

/** Request payload for Historical#load. */
class HistoricalLoadMatch
{
    public string $id;
}

/** Pool entity data model. */
class Pool
{
    public ?string $address = null;
    public ?float $apr = null;
    public ?string $chain = null;
    public ?string $dex = null;
    public ?string $id = null;
    public ?float $liquidity_usd = null;
    public ?array $token0 = null;
    public ?array $token1 = null;
    public ?float $volume_24h = null;
}

/** Request payload for Pool#list. */
class PoolListMatch
{
    public ?string $address = null;
    public ?float $apr = null;
    public ?string $chain = null;
    public ?string $dex = null;
    public ?string $id = null;
    public ?float $liquidity_usd = null;
    public ?array $token0 = null;
    public ?array $token1 = null;
    public ?float $volume_24h = null;
}

/** Ticker entity data model. */
class Ticker
{
    public ?float $price_change_24h = null;
    public ?float $price_usd = null;
    public ?string $symbol = null;
    public ?string $timestamp = null;
    public ?float $volume_24h = null;
}

/** Request payload for Ticker#list. */
class TickerListMatch
{
    public ?float $price_change_24h = null;
    public ?float $price_usd = null;
    public ?string $symbol = null;
    public ?string $timestamp = null;
    public ?float $volume_24h = null;
}

/** Token entity data model. */
class Token
{
    public ?string $address = null;
    public ?string $chain = null;
    public ?int $decimals = null;
    public ?string $id = null;
    public ?string $last_updated = null;
    public ?float $liquidity_usd = null;
    public ?float $market_cap = null;
    public ?string $name = null;
    public ?float $price_change_24h = null;
    public ?float $price_usd = null;
    public ?string $symbol = null;
    public ?float $total_supply = null;
    public ?float $volume_24h = null;
}

/** Request payload for Token#load. */
class TokenLoadMatch
{
    public string $id;
}

/** Request payload for Token#list. */
class TokenListMatch
{
    public ?string $address = null;
    public ?string $chain = null;
    public ?int $decimals = null;
    public ?string $id = null;
    public ?string $last_updated = null;
    public ?float $liquidity_usd = null;
    public ?float $market_cap = null;
    public ?string $name = null;
    public ?float $price_change_24h = null;
    public ?float $price_usd = null;
    public ?string $symbol = null;
    public ?float $total_supply = null;
    public ?float $volume_24h = null;
}


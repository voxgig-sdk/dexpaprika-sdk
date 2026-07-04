// Typed models for the Dexpaprika SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Exchange {
  chain?: string
  id?: string
  liquidity_usd?: number
  name?: string
  trades_24h?: number
  volume_24h?: number
}

export type ExchangeListMatch = Partial<Exchange>

export interface Historical {
  data?: any[]
  token_id?: string
}

export interface HistoricalLoadMatch {
  id: string
}

export interface Pool {
  address?: string
  apr?: number
  chain?: string
  dex?: string
  id?: string
  liquidity_usd?: number
  token0?: Record<string, any>
  token1?: Record<string, any>
  volume_24h?: number
}

export type PoolListMatch = Partial<Pool>

export interface Ticker {
  price_change_24h?: number
  price_usd?: number
  symbol?: string
  timestamp?: string
  volume_24h?: number
}

export type TickerListMatch = Partial<Ticker>

export interface Token {
  address?: string
  chain?: string
  decimal?: number
  id?: string
  last_updated?: string
  liquidity_usd?: number
  market_cap?: number
  name?: string
  price_change_24h?: number
  price_usd?: number
  symbol?: string
  total_supply?: number
  volume_24h?: number
}

export interface TokenLoadMatch {
  id: string
}

export type TokenListMatch = Partial<Token>


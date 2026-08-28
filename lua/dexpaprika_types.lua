-- Typed models for the Dexpaprika SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Exchange
---@field chain? string
---@field id? string
---@field liquidity_usd? number
---@field name? string
---@field trades_24h? number
---@field volume_24h? number

---@class ExchangeListMatch
---@field chain? string
---@field id? string
---@field liquidity_usd? number
---@field name? string
---@field trades_24h? number
---@field volume_24h? number

---@class Historical
---@field data? table
---@field id? string
---@field token_id? string

---@class HistoricalLoadMatch
---@field id string
---@field end? string
---@field interval? string
---@field start? string

---@class Pool
---@field address? string
---@field apr? number
---@field chain? string
---@field dex? string
---@field id? string
---@field liquidity_usd? number
---@field token0? table
---@field token1? table
---@field volume_24h? number

---@class PoolListMatch
---@field dex? string
---@field limit? number

---@class Ticker
---@field price_change_24h? number
---@field price_usd? number
---@field symbol? string
---@field timestamp? string
---@field volume_24h? number

---@class TickerListMatch
---@field symbol? string

---@class Token
---@field address? string
---@field chain? string
---@field decimals? number
---@field id? string
---@field last_updated? string
---@field liquidity_usd? number
---@field market_cap? number
---@field name? string
---@field price_change_24h? number
---@field price_usd? number
---@field symbol? string
---@field total_supply? number
---@field volume_24h? number

---@class TokenLoadMatch
---@field id string

---@class TokenListMatch
---@field chain? string
---@field limit? number
---@field offset? number

local M = {}

return M

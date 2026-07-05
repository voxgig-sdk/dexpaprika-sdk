# frozen_string_literal: true

# Typed models for the Dexpaprika SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Exchange entity data model.
#
# @!attribute [rw] chain
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] liquidity_usd
#   @return [Float, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] trades_24h
#   @return [Integer, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
Exchange = Struct.new(
  :chain,
  :id,
  :liquidity_usd,
  :name,
  :trades_24h,
  :volume_24h,
  keyword_init: true
)

# Request payload for Exchange#list.
#
# @!attribute [rw] chain
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] liquidity_usd
#   @return [Float, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] trades_24h
#   @return [Integer, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
ExchangeListMatch = Struct.new(
  :chain,
  :id,
  :liquidity_usd,
  :name,
  :trades_24h,
  :volume_24h,
  keyword_init: true
)

# Historical entity data model.
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] token_id
#   @return [String, nil]
Historical = Struct.new(
  :data,
  :token_id,
  keyword_init: true
)

# Request payload for Historical#load.
#
# @!attribute [rw] id
#   @return [String]
HistoricalLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Pool entity data model.
#
# @!attribute [rw] address
#   @return [String, nil]
#
# @!attribute [rw] apr
#   @return [Float, nil]
#
# @!attribute [rw] chain
#   @return [String, nil]
#
# @!attribute [rw] dex
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] liquidity_usd
#   @return [Float, nil]
#
# @!attribute [rw] token0
#   @return [Hash, nil]
#
# @!attribute [rw] token1
#   @return [Hash, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
Pool = Struct.new(
  :address,
  :apr,
  :chain,
  :dex,
  :id,
  :liquidity_usd,
  :token0,
  :token1,
  :volume_24h,
  keyword_init: true
)

# Request payload for Pool#list.
#
# @!attribute [rw] address
#   @return [String, nil]
#
# @!attribute [rw] apr
#   @return [Float, nil]
#
# @!attribute [rw] chain
#   @return [String, nil]
#
# @!attribute [rw] dex
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] liquidity_usd
#   @return [Float, nil]
#
# @!attribute [rw] token0
#   @return [Hash, nil]
#
# @!attribute [rw] token1
#   @return [Hash, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
PoolListMatch = Struct.new(
  :address,
  :apr,
  :chain,
  :dex,
  :id,
  :liquidity_usd,
  :token0,
  :token1,
  :volume_24h,
  keyword_init: true
)

# Ticker entity data model.
#
# @!attribute [rw] price_change_24h
#   @return [Float, nil]
#
# @!attribute [rw] price_usd
#   @return [Float, nil]
#
# @!attribute [rw] symbol
#   @return [String, nil]
#
# @!attribute [rw] timestamp
#   @return [String, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
Ticker = Struct.new(
  :price_change_24h,
  :price_usd,
  :symbol,
  :timestamp,
  :volume_24h,
  keyword_init: true
)

# Request payload for Ticker#list.
#
# @!attribute [rw] price_change_24h
#   @return [Float, nil]
#
# @!attribute [rw] price_usd
#   @return [Float, nil]
#
# @!attribute [rw] symbol
#   @return [String, nil]
#
# @!attribute [rw] timestamp
#   @return [String, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
TickerListMatch = Struct.new(
  :price_change_24h,
  :price_usd,
  :symbol,
  :timestamp,
  :volume_24h,
  keyword_init: true
)

# Token entity data model.
#
# @!attribute [rw] address
#   @return [String, nil]
#
# @!attribute [rw] chain
#   @return [String, nil]
#
# @!attribute [rw] decimal
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] last_updated
#   @return [String, nil]
#
# @!attribute [rw] liquidity_usd
#   @return [Float, nil]
#
# @!attribute [rw] market_cap
#   @return [Float, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] price_change_24h
#   @return [Float, nil]
#
# @!attribute [rw] price_usd
#   @return [Float, nil]
#
# @!attribute [rw] symbol
#   @return [String, nil]
#
# @!attribute [rw] total_supply
#   @return [Float, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
Token = Struct.new(
  :address,
  :chain,
  :decimal,
  :id,
  :last_updated,
  :liquidity_usd,
  :market_cap,
  :name,
  :price_change_24h,
  :price_usd,
  :symbol,
  :total_supply,
  :volume_24h,
  keyword_init: true
)

# Request payload for Token#load.
#
# @!attribute [rw] id
#   @return [String]
TokenLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Token#list.
#
# @!attribute [rw] address
#   @return [String, nil]
#
# @!attribute [rw] chain
#   @return [String, nil]
#
# @!attribute [rw] decimal
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] last_updated
#   @return [String, nil]
#
# @!attribute [rw] liquidity_usd
#   @return [Float, nil]
#
# @!attribute [rw] market_cap
#   @return [Float, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] price_change_24h
#   @return [Float, nil]
#
# @!attribute [rw] price_usd
#   @return [Float, nil]
#
# @!attribute [rw] symbol
#   @return [String, nil]
#
# @!attribute [rw] total_supply
#   @return [Float, nil]
#
# @!attribute [rw] volume_24h
#   @return [Float, nil]
TokenListMatch = Struct.new(
  :address,
  :chain,
  :decimal,
  :id,
  :last_updated,
  :liquidity_usd,
  :market_cap,
  :name,
  :price_change_24h,
  :price_usd,
  :symbol,
  :total_supply,
  :volume_24h,
  keyword_init: true
)


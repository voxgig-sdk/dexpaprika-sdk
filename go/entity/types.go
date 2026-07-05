// Typed models for the Dexpaprika SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Exchange is the typed data model for the exchange entity.
type Exchange struct {
	Chain *string `json:"chain,omitempty"`
	Id *string `json:"id,omitempty"`
	LiquidityUsd *float64 `json:"liquidity_usd,omitempty"`
	Name *string `json:"name,omitempty"`
	Trades24h *int `json:"trades_24h,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// ExchangeListMatch is the typed request payload for Exchange.ListTyped.
type ExchangeListMatch struct {
	Chain *string `json:"chain,omitempty"`
	Id *string `json:"id,omitempty"`
	LiquidityUsd *float64 `json:"liquidity_usd,omitempty"`
	Name *string `json:"name,omitempty"`
	Trades24h *int `json:"trades_24h,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// Historical is the typed data model for the historical entity.
type Historical struct {
	Data *[]any `json:"data,omitempty"`
	TokenId *string `json:"token_id,omitempty"`
}

// HistoricalLoadMatch is the typed request payload for Historical.LoadTyped.
type HistoricalLoadMatch struct {
	Id string `json:"id"`
}

// Pool is the typed data model for the pool entity.
type Pool struct {
	Address *string `json:"address,omitempty"`
	Apr *float64 `json:"apr,omitempty"`
	Chain *string `json:"chain,omitempty"`
	Dex *string `json:"dex,omitempty"`
	Id *string `json:"id,omitempty"`
	LiquidityUsd *float64 `json:"liquidity_usd,omitempty"`
	Token0 *map[string]any `json:"token0,omitempty"`
	Token1 *map[string]any `json:"token1,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// PoolListMatch is the typed request payload for Pool.ListTyped.
type PoolListMatch struct {
	Address *string `json:"address,omitempty"`
	Apr *float64 `json:"apr,omitempty"`
	Chain *string `json:"chain,omitempty"`
	Dex *string `json:"dex,omitempty"`
	Id *string `json:"id,omitempty"`
	LiquidityUsd *float64 `json:"liquidity_usd,omitempty"`
	Token0 *map[string]any `json:"token0,omitempty"`
	Token1 *map[string]any `json:"token1,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// Ticker is the typed data model for the ticker entity.
type Ticker struct {
	PriceChange24h *float64 `json:"price_change_24h,omitempty"`
	PriceUsd *float64 `json:"price_usd,omitempty"`
	Symbol *string `json:"symbol,omitempty"`
	Timestamp *string `json:"timestamp,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// TickerListMatch is the typed request payload for Ticker.ListTyped.
type TickerListMatch struct {
	PriceChange24h *float64 `json:"price_change_24h,omitempty"`
	PriceUsd *float64 `json:"price_usd,omitempty"`
	Symbol *string `json:"symbol,omitempty"`
	Timestamp *string `json:"timestamp,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// Token is the typed data model for the token entity.
type Token struct {
	Address *string `json:"address,omitempty"`
	Chain *string `json:"chain,omitempty"`
	Decimal *int `json:"decimal,omitempty"`
	Id *string `json:"id,omitempty"`
	LastUpdated *string `json:"last_updated,omitempty"`
	LiquidityUsd *float64 `json:"liquidity_usd,omitempty"`
	MarketCap *float64 `json:"market_cap,omitempty"`
	Name *string `json:"name,omitempty"`
	PriceChange24h *float64 `json:"price_change_24h,omitempty"`
	PriceUsd *float64 `json:"price_usd,omitempty"`
	Symbol *string `json:"symbol,omitempty"`
	TotalSupply *float64 `json:"total_supply,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// TokenLoadMatch is the typed request payload for Token.LoadTyped.
type TokenLoadMatch struct {
	Id string `json:"id"`
}

// TokenListMatch is the typed request payload for Token.ListTyped.
type TokenListMatch struct {
	Address *string `json:"address,omitempty"`
	Chain *string `json:"chain,omitempty"`
	Decimal *int `json:"decimal,omitempty"`
	Id *string `json:"id,omitempty"`
	LastUpdated *string `json:"last_updated,omitempty"`
	LiquidityUsd *float64 `json:"liquidity_usd,omitempty"`
	MarketCap *float64 `json:"market_cap,omitempty"`
	Name *string `json:"name,omitempty"`
	PriceChange24h *float64 `json:"price_change_24h,omitempty"`
	PriceUsd *float64 `json:"price_usd,omitempty"`
	Symbol *string `json:"symbol,omitempty"`
	TotalSupply *float64 `json:"total_supply,omitempty"`
	Volume24h *float64 `json:"volume_24h,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

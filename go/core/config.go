package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Dexpaprika",
			"slug": "dexpaprika",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://api.dexpaprika.com",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"exchange": map[string]any{},
				"historical": map[string]any{},
				"pool": map[string]any{},
				"ticker": map[string]any{},
				"token": map[string]any{},
			},
		},
		"entity": map[string]any{
			"exchange": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "chain",
						"short": "Blockchain network",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "Exchange identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "liquidity_usd",
						"short": "Total liquidity in USD",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "name",
						"short": "Exchange name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "trades_24h",
						"short": "Number of trades in last 24 hours",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "volume_24h",
						"short": "24-hour trading volume",
						"type": "`$NUMBER`",
					},
				},
				"name": "exchange",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/exchanges",
								"parts": []any{
									"v1",
									"exchanges",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"historical": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "data",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "token_id",
						"short": "Token identifier",
						"type": "`$STRING`",
					},
				},
				"name": "historical",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "token_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "end",
											"orig": "end",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "1h",
											"kind": "query",
											"name": "interval",
											"orig": "interval",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "start",
											"orig": "start",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/historical/{token_id}",
								"parts": []any{
									"v1",
									"historical",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"token_id": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"end",
										"id",
										"interval",
										"start",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"pool": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "address",
						"short": "Pool contract address",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "apr",
						"short": "Annual percentage rate",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "chain",
						"short": "Blockchain network",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dex",
						"short": "DEX platform name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "Unique pool identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "liquidity_usd",
						"short": "Total liquidity in USD",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "token0",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "token1",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "volume_24h",
						"short": "24-hour trading volume",
						"type": "`$NUMBER`",
					},
				},
				"name": "pool",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "dex",
											"orig": "dex",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 100,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/pools",
								"parts": []any{
									"v1",
									"pools",
								},
								"select": map[string]any{
									"exist": []any{
										"dex",
										"limit",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"ticker": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "price_change_24h",
						"short": "24-hour price change percentage",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "price_usd",
						"short": "Current price in USD",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "symbol",
						"short": "Token symbol",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "timestamp",
						"short": "Timestamp of ticker data",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "volume_24h",
						"short": "24-hour trading volume",
						"type": "`$NUMBER`",
					},
				},
				"name": "ticker",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "symbol",
											"orig": "symbol",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/tickers",
								"parts": []any{
									"v1",
									"tickers",
								},
								"select": map[string]any{
									"exist": []any{
										"symbol",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"token": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "address",
						"short": "Token contract address",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "chain",
						"short": "Blockchain network",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "decimals",
						"short": "Token decimal places",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "id",
						"short": "Unique token identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "last_updated",
						"short": "Timestamp of last data update",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "liquidity_usd",
						"short": "Total liquidity in USD",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "market_cap",
						"short": "Market capitalization in USD",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "name",
						"short": "Token name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "price_change_24h",
						"short": "24-hour price change percentage",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "price_usd",
						"short": "Current price in USD",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "symbol",
						"short": "Token symbol",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "total_supply",
						"short": "Total token supply",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "volume_24h",
						"short": "24-hour trading volume",
						"type": "`$NUMBER`",
					},
				},
				"name": "token",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "chain",
											"orig": "chain",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 100,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "offset",
											"orig": "offset",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/tokens",
								"parts": []any{
									"v1",
									"tokens",
								},
								"select": map[string]any{
									"exist": []any{
										"chain",
										"limit",
										"offset",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "token_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/tokens/{token_id}",
								"parts": []any{
									"v1",
									"tokens",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"token_id": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}

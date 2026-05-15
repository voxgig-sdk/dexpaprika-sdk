
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'ProjectName',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    }

  }


  options = {
    base: 'https://api.dexpaprika.com',

    auth: {
      prefix: 'Bearer',
    },

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      exchange: {
      },

      historical: {
      },

      pool: {
      },

      ticker: {
      },

      token: {
      },

    }
  }


  entity = {
    "exchange": {
      "fields": [
        {
          "name": "chain",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 0
        },
        {
          "name": "id",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 1
        },
        {
          "name": "liquidity_usd",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 2
        },
        {
          "name": "name",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 3
        },
        {
          "name": "trades_24h",
          "req": false,
          "type": "`$INTEGER`",
          "active": true,
          "index$": 4
        },
        {
          "name": "volume_24h",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 5
        }
      ],
      "name": "exchange",
      "op": {
        "list": {
          "name": "list",
          "points": [
            {
              "method": "GET",
              "orig": "/v1/exchanges",
              "parts": [
                "v1",
                "exchanges"
              ],
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "args": {},
              "select": {},
              "index$": 0
            }
          ],
          "input": "data",
          "key$": "list"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "historical": {
      "fields": [
        {
          "name": "data",
          "req": false,
          "type": "`$ARRAY`",
          "active": true,
          "index$": 0
        },
        {
          "name": "token_id",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 1
        }
      ],
      "name": "historical",
      "op": {
        "load": {
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "token_id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "active": true
                  }
                ],
                "query": [
                  {
                    "kind": "query",
                    "name": "end",
                    "orig": "end",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  },
                  {
                    "example": "1h",
                    "kind": "query",
                    "name": "interval",
                    "orig": "interval",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  },
                  {
                    "kind": "query",
                    "name": "start",
                    "orig": "start",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  }
                ]
              },
              "method": "GET",
              "orig": "/v1/historical/{token_id}",
              "parts": [
                "v1",
                "historical",
                "{id}"
              ],
              "rename": {
                "param": {
                  "token_id": "id"
                }
              },
              "select": {
                "exist": [
                  "end",
                  "id",
                  "interval",
                  "start"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "index$": 0
            }
          ],
          "input": "data",
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "pool": {
      "fields": [
        {
          "name": "address",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 0
        },
        {
          "name": "apr",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 1
        },
        {
          "name": "chain",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 2
        },
        {
          "name": "dex",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 3
        },
        {
          "name": "id",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 4
        },
        {
          "name": "liquidity_usd",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 5
        },
        {
          "name": "token0",
          "req": false,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 6
        },
        {
          "name": "token1",
          "req": false,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 7
        },
        {
          "name": "volume_24h",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 8
        }
      ],
      "name": "pool",
      "op": {
        "list": {
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "dex",
                    "orig": "dex",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  },
                  {
                    "example": 100,
                    "kind": "query",
                    "name": "limit",
                    "orig": "limit",
                    "reqd": false,
                    "type": "`$INTEGER`",
                    "active": true
                  }
                ]
              },
              "method": "GET",
              "orig": "/v1/pools",
              "parts": [
                "v1",
                "pools"
              ],
              "select": {
                "exist": [
                  "dex",
                  "limit"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "index$": 0
            }
          ],
          "input": "data",
          "key$": "list"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "ticker": {
      "fields": [
        {
          "name": "price_change_24h",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 0
        },
        {
          "name": "price_usd",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 1
        },
        {
          "name": "symbol",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 2
        },
        {
          "name": "timestamp",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 3
        },
        {
          "name": "volume_24h",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 4
        }
      ],
      "name": "ticker",
      "op": {
        "list": {
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "symbol",
                    "orig": "symbol",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  }
                ]
              },
              "method": "GET",
              "orig": "/v1/tickers",
              "parts": [
                "v1",
                "tickers"
              ],
              "select": {
                "exist": [
                  "symbol"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "index$": 0
            }
          ],
          "input": "data",
          "key$": "list"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "token": {
      "fields": [
        {
          "name": "address",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 0
        },
        {
          "name": "chain",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 1
        },
        {
          "name": "decimal",
          "req": false,
          "type": "`$INTEGER`",
          "active": true,
          "index$": 2
        },
        {
          "name": "id",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 3
        },
        {
          "name": "last_updated",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 4
        },
        {
          "name": "liquidity_usd",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 5
        },
        {
          "name": "market_cap",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 6
        },
        {
          "name": "name",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 7
        },
        {
          "name": "price_change_24h",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 8
        },
        {
          "name": "price_usd",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 9
        },
        {
          "name": "symbol",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 10
        },
        {
          "name": "total_supply",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 11
        },
        {
          "name": "volume_24h",
          "req": false,
          "type": "`$NUMBER`",
          "active": true,
          "index$": 12
        }
      ],
      "name": "token",
      "op": {
        "list": {
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "chain",
                    "orig": "chain",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  },
                  {
                    "example": 100,
                    "kind": "query",
                    "name": "limit",
                    "orig": "limit",
                    "reqd": false,
                    "type": "`$INTEGER`",
                    "active": true
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "offset",
                    "orig": "offset",
                    "reqd": false,
                    "type": "`$INTEGER`",
                    "active": true
                  }
                ]
              },
              "method": "GET",
              "orig": "/v1/tokens",
              "parts": [
                "v1",
                "tokens"
              ],
              "select": {
                "exist": [
                  "chain",
                  "limit",
                  "offset"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "index$": 0
            }
          ],
          "input": "data",
          "key$": "list"
        },
        "load": {
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "token_id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "active": true
                  }
                ]
              },
              "method": "GET",
              "orig": "/v1/tokens/{token_id}",
              "parts": [
                "v1",
                "tokens",
                "{id}"
              ],
              "rename": {
                "param": {
                  "token_id": "id"
                }
              },
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "index$": 0
            }
          ],
          "input": "data",
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}


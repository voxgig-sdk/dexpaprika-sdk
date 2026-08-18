-- Dexpaprika SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "Dexpaprika",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.dexpaprika.com",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["exchange"] = {},
        ["historical"] = {},
        ["pool"] = {},
        ["ticker"] = {},
        ["token"] = {},
      },
    },
    entity = {
      ["exchange"] = {
        ["fields"] = {
          {
            ["name"] = "chain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "liquidity_usd",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "trades_24h",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "volume_24h",
            ["type"] = "`$NUMBER`",
          },
        },
        ["name"] = "exchange",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/exchanges",
                ["parts"] = {
                  "v1",
                  "exchanges",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["historical"] = {
        ["fields"] = {
          {
            ["name"] = "data",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "token_id",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "historical",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "token_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "end",
                      ["orig"] = "end",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "1h",
                      ["kind"] = "query",
                      ["name"] = "interval",
                      ["orig"] = "interval",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "start",
                      ["orig"] = "start",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/historical/{token_id}",
                ["parts"] = {
                  "v1",
                  "historical",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["token_id"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "end",
                    "id",
                    "interval",
                    "start",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["pool"] = {
        ["fields"] = {
          {
            ["name"] = "address",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "apr",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "chain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "dex",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "liquidity_usd",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "token0",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "token1",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "volume_24h",
            ["type"] = "`$NUMBER`",
          },
        },
        ["name"] = "pool",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "dex",
                      ["orig"] = "dex",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 100,
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/pools",
                ["parts"] = {
                  "v1",
                  "pools",
                },
                ["select"] = {
                  ["exist"] = {
                    "dex",
                    "limit",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["ticker"] = {
        ["fields"] = {
          {
            ["name"] = "price_change_24h",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "price_usd",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "symbol",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "timestamp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "volume_24h",
            ["type"] = "`$NUMBER`",
          },
        },
        ["name"] = "ticker",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "symbol",
                      ["orig"] = "symbol",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/tickers",
                ["parts"] = {
                  "v1",
                  "tickers",
                },
                ["select"] = {
                  ["exist"] = {
                    "symbol",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["token"] = {
        ["fields"] = {
          {
            ["name"] = "address",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "chain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "decimals",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "last_updated",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "liquidity_usd",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "market_cap",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "price_change_24h",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "price_usd",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "symbol",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "total_supply",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "volume_24h",
            ["type"] = "`$NUMBER`",
          },
        },
        ["name"] = "token",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "chain",
                      ["orig"] = "chain",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 100,
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = 0,
                      ["kind"] = "query",
                      ["name"] = "offset",
                      ["orig"] = "offset",
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/tokens",
                ["parts"] = {
                  "v1",
                  "tokens",
                },
                ["select"] = {
                  ["exist"] = {
                    "chain",
                    "limit",
                    "offset",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "token_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/tokens/{token_id}",
                ["parts"] = {
                  "v1",
                  "tokens",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["token_id"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config

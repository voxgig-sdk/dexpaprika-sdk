# Dexpaprika Ruby SDK Reference

Complete API reference for the Dexpaprika Ruby SDK.


## DexpaprikaSDK

### Constructor

```ruby
require_relative 'Dexpaprika_sdk'

client = DexpaprikaSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DexpaprikaSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = DexpaprikaSDK.test
```


### Instance Methods

#### `Exchange(data = nil)`

Create a new `Exchange` entity instance. Pass `nil` for no initial data.

#### `Historical(data = nil)`

Create a new `Historical` entity instance. Pass `nil` for no initial data.

#### `Pool(data = nil)`

Create a new `Pool` entity instance. Pass `nil` for no initial data.

#### `Ticker(data = nil)`

Create a new `Ticker` entity instance. Pass `nil` for no initial data.

#### `Token(data = nil)`

Create a new `Token` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## ExchangeEntity

```ruby
exchange = client.Exchange
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `chain` | `String` | No | Blockchain network |
| `id` | `String` | No | Exchange identifier |
| `liquidity_usd` | `Float` | No | Total liquidity in USD |
| `name` | `String` | No | Exchange name |
| `trades_24h` | `Integer` | No | Number of trades in last 24 hours |
| `volume_24h` | `Float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Exchange.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ExchangeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## HistoricalEntity

```ruby
historical = client.Historical
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `Array` | No |  |
| `id` | `String` | No |  |
| `token_id` | `String` | No | Token identifier |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Historical.load({ "id" => "historical_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `HistoricalEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PoolEntity

```ruby
pool = client.Pool
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `String` | No | Pool contract address |
| `apr` | `Float` | No | Annual percentage rate |
| `chain` | `String` | No | Blockchain network |
| `dex` | `String` | No | DEX platform name |
| `id` | `String` | No | Unique pool identifier |
| `liquidity_usd` | `Float` | No | Total liquidity in USD |
| `token0` | `Hash` | No |  |
| `token1` | `Hash` | No |  |
| `volume_24h` | `Float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Pool.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PoolEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TickerEntity

```ruby
ticker = client.Ticker
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `price_change_24h` | `Float` | No | 24-hour price change percentage |
| `price_usd` | `Float` | No | Current price in USD |
| `symbol` | `String` | No | Token symbol |
| `timestamp` | `String` | No | Timestamp of ticker data |
| `volume_24h` | `Float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Ticker.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TickerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TokenEntity

```ruby
token = client.Token
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `String` | No | Token contract address |
| `chain` | `String` | No | Blockchain network |
| `decimals` | `Integer` | No | Token decimal places |
| `id` | `String` | No | Unique token identifier |
| `last_updated` | `String` | No | Timestamp of last data update |
| `liquidity_usd` | `Float` | No | Total liquidity in USD |
| `market_cap` | `Float` | No | Market capitalization in USD |
| `name` | `String` | No | Token name |
| `price_change_24h` | `Float` | No | 24-hour price change percentage |
| `price_usd` | `Float` | No | Current price in USD |
| `symbol` | `String` | No | Token symbol |
| `total_supply` | `Float` | No | Total token supply |
| `volume_24h` | `Float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Token.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Token.load({ "id" => "token_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TokenEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = DexpaprikaSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```


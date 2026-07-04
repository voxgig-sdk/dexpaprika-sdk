# Dexpaprika Ruby SDK Reference

Complete API reference for the Dexpaprika Ruby SDK.


## DexpaprikaSDK

### Constructor

```ruby
require_relative 'dexpaprika_sdk'

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
| `chain` | ``$STRING`` | No |  |
| `id` | ``$STRING`` | No |  |
| `liquidity_usd` | ``$NUMBER`` | No |  |
| `name` | ``$STRING`` | No |  |
| `trades_24h` | ``$INTEGER`` | No |  |
| `volume_24h` | ``$NUMBER`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.Exchange.list(nil)
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
| `data` | ``$ARRAY`` | No |  |
| `token_id` | ``$STRING`` | No |  |

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
| `address` | ``$STRING`` | No |  |
| `apr` | ``$NUMBER`` | No |  |
| `chain` | ``$STRING`` | No |  |
| `dex` | ``$STRING`` | No |  |
| `id` | ``$STRING`` | No |  |
| `liquidity_usd` | ``$NUMBER`` | No |  |
| `token0` | ``$OBJECT`` | No |  |
| `token1` | ``$OBJECT`` | No |  |
| `volume_24h` | ``$NUMBER`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.Pool.list(nil)
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
| `price_change_24h` | ``$NUMBER`` | No |  |
| `price_usd` | ``$NUMBER`` | No |  |
| `symbol` | ``$STRING`` | No |  |
| `timestamp` | ``$STRING`` | No |  |
| `volume_24h` | ``$NUMBER`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.Ticker.list(nil)
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
| `address` | ``$STRING`` | No |  |
| `chain` | ``$STRING`` | No |  |
| `decimal` | ``$INTEGER`` | No |  |
| `id` | ``$STRING`` | No |  |
| `last_updated` | ``$STRING`` | No |  |
| `liquidity_usd` | ``$NUMBER`` | No |  |
| `market_cap` | ``$NUMBER`` | No |  |
| `name` | ``$STRING`` | No |  |
| `price_change_24h` | ``$NUMBER`` | No |  |
| `price_usd` | ``$NUMBER`` | No |  |
| `symbol` | ``$STRING`` | No |  |
| `total_supply` | ``$NUMBER`` | No |  |
| `volume_24h` | ``$NUMBER`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.Token.list(nil)
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


# Dexpaprika Golang SDK Reference

Complete API reference for the Dexpaprika Golang SDK.


## DexpaprikaSDK

### Constructor

```go
func NewDexpaprikaSDK(options map[string]any) *DexpaprikaSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `TestSDK(testopts, sdkopts map[string]any) *DexpaprikaSDK`

Create a test client with mock features active. Both arguments may be `nil`.

```go
client := sdk.TestSDK(nil, nil)
```


### Instance Methods

#### `Exchange(data map[string]any) DexpaprikaEntity`

Create a new `Exchange` entity instance. Pass `nil` for no initial data.

#### `Historical(data map[string]any) DexpaprikaEntity`

Create a new `Historical` entity instance. Pass `nil` for no initial data.

#### `Pool(data map[string]any) DexpaprikaEntity`

Create a new `Pool` entity instance. Pass `nil` for no initial data.

#### `Ticker(data map[string]any) DexpaprikaEntity`

Create a new `Ticker` entity instance. Pass `nil` for no initial data.

#### `Token(data map[string]any) DexpaprikaEntity`

Create a new `Token` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## ExchangeEntity

```go
exchange := client.Exchange(nil)
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Exchange(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ExchangeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## HistoricalEntity

```go
historical := client.Historical(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | ``$ARRAY`` | No |  |
| `token_id` | ``$STRING`` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Historical(nil).Load(map[string]any{"id": "historical_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `HistoricalEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PoolEntity

```go
pool := client.Pool(nil)
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Pool(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PoolEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TickerEntity

```go
ticker := client.Ticker(nil)
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Ticker(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TickerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TokenEntity

```go
token := client.Token(nil)
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Token(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Token(nil).Load(map[string]any{"id": "token_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TokenEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewDexpaprikaSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```


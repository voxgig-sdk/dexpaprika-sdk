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
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *DexpaprikaSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *DexpaprikaSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
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
fmt.Println(exchange.GetName()) // "exchange"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `chain` | `string` | No | Blockchain network |
| `id` | `string` | No | Exchange identifier |
| `liquidity_usd` | `float64` | No | Total liquidity in USD |
| `name` | `string` | No | Exchange name |
| `trades_24h` | `int` | No | Number of trades in last 24 hours |
| `volume_24h` | `float64` | No | 24-hour trading volume |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Exchange(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
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
fmt.Println(historical.GetName()) // "historical"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `[]any` | No |  |
| `id` | `string` | No |  |
| `token_id` | `string` | No | Token identifier |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Historical(nil).Load(map[string]any{"id": "historical_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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
fmt.Println(pool.GetName()) // "pool"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `string` | No | Pool contract address |
| `apr` | `float64` | No | Annual percentage rate |
| `chain` | `string` | No | Blockchain network |
| `dex` | `string` | No | DEX platform name |
| `id` | `string` | No | Unique pool identifier |
| `liquidity_usd` | `float64` | No | Total liquidity in USD |
| `token0` | `map[string]any` | No |  |
| `token1` | `map[string]any` | No |  |
| `volume_24h` | `float64` | No | 24-hour trading volume |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Pool(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
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
fmt.Println(ticker.GetName()) // "ticker"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `price_change_24h` | `float64` | No | 24-hour price change percentage |
| `price_usd` | `float64` | No | Current price in USD |
| `symbol` | `string` | No | Token symbol |
| `timestamp` | `string` | No | Timestamp of ticker data |
| `volume_24h` | `float64` | No | 24-hour trading volume |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Ticker(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
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
fmt.Println(token.GetName()) // "token"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `string` | No | Token contract address |
| `chain` | `string` | No | Blockchain network |
| `decimals` | `int` | No | Token decimal places |
| `id` | `string` | No | Unique token identifier |
| `last_updated` | `string` | No | Timestamp of last data update |
| `liquidity_usd` | `float64` | No | Total liquidity in USD |
| `market_cap` | `float64` | No | Market capitalization in USD |
| `name` | `string` | No | Token name |
| `price_change_24h` | `float64` | No | 24-hour price change percentage |
| `price_usd` | `float64` | No | Current price in USD |
| `symbol` | `string` | No | Token symbol |
| `total_supply` | `float64` | No | Total token supply |
| `volume_24h` | `float64` | No | 24-hour trading volume |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Token(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Token(nil).Load(map[string]any{"id": "token_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.


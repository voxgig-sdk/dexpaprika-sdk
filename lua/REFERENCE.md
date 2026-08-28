# Dexpaprika Lua SDK Reference

Complete API reference for the Dexpaprika Lua SDK.


## DexpaprikaSDK

### Constructor

```lua
local sdk = require("dexpaprika_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Exchange(data)`

Create a new `Exchange` entity instance. Pass `nil` for no initial data.

#### `Historical(data)`

Create a new `Historical` entity instance. Pass `nil` for no initial data.

#### `Pool(data)`

Create a new `Pool` entity instance. Pass `nil` for no initial data.

#### `Ticker(data)`

Create a new `Ticker` entity instance. Pass `nil` for no initial data.

#### `Token(data)`

Create a new `Token` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## ExchangeEntity

```lua
local exchange = client:Exchange(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `chain` | `string` | No | Blockchain network |
| `id` | `string` | No | Exchange identifier |
| `liquidity_usd` | `number` | No | Total liquidity in USD |
| `name` | `string` | No | Exchange name |
| `trades_24h` | `number` | No | Number of trades in last 24 hours |
| `volume_24h` | `number` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Exchange():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ExchangeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## HistoricalEntity

```lua
local historical = client:Historical(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `table` | No |  |
| `id` | `string` | No |  |
| `token_id` | `string` | No | Token identifier |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Historical():load({ id = "historical_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HistoricalEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PoolEntity

```lua
local pool = client:Pool(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `string` | No | Pool contract address |
| `apr` | `number` | No | Annual percentage rate |
| `chain` | `string` | No | Blockchain network |
| `dex` | `string` | No | DEX platform name |
| `id` | `string` | No | Unique pool identifier |
| `liquidity_usd` | `number` | No | Total liquidity in USD |
| `token0` | `table` | No |  |
| `token1` | `table` | No |  |
| `volume_24h` | `number` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Pool():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PoolEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TickerEntity

```lua
local ticker = client:Ticker(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `price_change_24h` | `number` | No | 24-hour price change percentage |
| `price_usd` | `number` | No | Current price in USD |
| `symbol` | `string` | No | Token symbol |
| `timestamp` | `string` | No | Timestamp of ticker data |
| `volume_24h` | `number` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Ticker():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TickerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TokenEntity

```lua
local token = client:Token(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `string` | No | Token contract address |
| `chain` | `string` | No | Blockchain network |
| `decimals` | `number` | No | Token decimal places |
| `id` | `string` | No | Unique token identifier |
| `last_updated` | `string` | No | Timestamp of last data update |
| `liquidity_usd` | `number` | No | Total liquidity in USD |
| `market_cap` | `number` | No | Market capitalization in USD |
| `name` | `string` | No | Token name |
| `price_change_24h` | `number` | No | 24-hour price change percentage |
| `price_usd` | `number` | No | Current price in USD |
| `symbol` | `string` | No | Token symbol |
| `total_supply` | `number` | No | Total token supply |
| `volume_24h` | `number` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Token():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Token():load({ id = "token_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TokenEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
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


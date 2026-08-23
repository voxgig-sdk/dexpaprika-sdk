# Dexpaprika TypeScript SDK Reference

Complete API reference for the Dexpaprika TypeScript SDK.


## DexpaprikaSDK

### Constructor

```ts
new DexpaprikaSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DexpaprikaSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = DexpaprikaSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `DexpaprikaSDK` instance in test mode.


### Instance Methods

#### `Exchange(data?: object)`

Create a new `Exchange` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ExchangeEntity` instance.

#### `Historical(data?: object)`

Create a new `Historical` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `HistoricalEntity` instance.

#### `Pool(data?: object)`

Create a new `Pool` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PoolEntity` instance.

#### `Ticker(data?: object)`

Create a new `Ticker` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TickerEntity` instance.

#### `Token(data?: object)`

Create a new `Token` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TokenEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `DexpaprikaSDK.test()`.

**Returns:** `DexpaprikaSDK` instance in test mode.


---

## ExchangeEntity

```ts
const exchange = client.Exchange()
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Exchange().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ExchangeEntity` instance with the same client and
options.

#### `client()`

Return the parent `DexpaprikaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## HistoricalEntity

```ts
const historical = client.Historical()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `any[]` | No |  |
| `token_id` | `string` | No | Token identifier |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Historical().load({ id: 'historical_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `HistoricalEntity` instance with the same client and
options.

#### `client()`

Return the parent `DexpaprikaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PoolEntity

```ts
const pool = client.Pool()
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
| `token0` | `Record<string, any>` | No |  |
| `token1` | `Record<string, any>` | No |  |
| `volume_24h` | `number` | No | 24-hour trading volume |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Pool().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PoolEntity` instance with the same client and
options.

#### `client()`

Return the parent `DexpaprikaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TickerEntity

```ts
const ticker = client.Ticker()
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Ticker().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TickerEntity` instance with the same client and
options.

#### `client()`

Return the parent `DexpaprikaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TokenEntity

```ts
const token = client.Token()
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Token().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Token().load({ id: 'token_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TokenEntity` instance with the same client and
options.

#### `client()`

Return the parent `DexpaprikaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new DexpaprikaSDK({
  feature: {
    test: { active: true },
  }
})
```


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
| `options.apikey` | `string` | API key for authentication. |
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
| `chain` | ``$STRING`` | No |  |
| `id` | ``$STRING`` | No |  |
| `liquidity_usd` | ``$NUMBER`` | No |  |
| `name` | ``$STRING`` | No |  |
| `trades_24h` | ``$INTEGER`` | No |  |
| `volume_24h` | ``$NUMBER`` | No |  |

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
| `data` | ``$ARRAY`` | No |  |
| `token_id` | ``$STRING`` | No |  |

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
| `price_change_24h` | ``$NUMBER`` | No |  |
| `price_usd` | ``$NUMBER`` | No |  |
| `symbol` | ``$STRING`` | No |  |
| `timestamp` | ``$STRING`` | No |  |
| `volume_24h` | ``$NUMBER`` | No |  |

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


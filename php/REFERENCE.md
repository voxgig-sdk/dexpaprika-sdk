# Dexpaprika PHP SDK Reference

Complete API reference for the Dexpaprika PHP SDK.


## DexpaprikaSDK

### Constructor

```php
require_once __DIR__ . '/dexpaprika_sdk.php';

$client = new DexpaprikaSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DexpaprikaSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = DexpaprikaSDK::test();
```


### Instance Methods

#### `Exchange($data = null)`

Create a new `ExchangeEntity` instance. Pass `null` for no initial data.

#### `Historical($data = null)`

Create a new `HistoricalEntity` instance. Pass `null` for no initial data.

#### `Pool($data = null)`

Create a new `PoolEntity` instance. Pass `null` for no initial data.

#### `Ticker($data = null)`

Create a new `TickerEntity` instance. Pass `null` for no initial data.

#### `Token($data = null)`

Create a new `TokenEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): DexpaprikaUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## ExchangeEntity

```php
$exchange = $client->Exchange();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `chain` | `string` | No | Blockchain network |
| `id` | `string` | No | Exchange identifier |
| `liquidity_usd` | `float` | No | Total liquidity in USD |
| `name` | `string` | No | Exchange name |
| `trades_24h` | `int` | No | Number of trades in last 24 hours |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Exchange()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ExchangeEntity`

Create a new `ExchangeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## HistoricalEntity

```php
$historical = $client->Historical();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `array` | No |  |
| `token_id` | `string` | No | Token identifier |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Historical()->load(["id" => "historical_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): HistoricalEntity`

Create a new `HistoricalEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PoolEntity

```php
$pool = $client->Pool();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `string` | No | Pool contract address |
| `apr` | `float` | No | Annual percentage rate |
| `chain` | `string` | No | Blockchain network |
| `dex` | `string` | No | DEX platform name |
| `id` | `string` | No | Unique pool identifier |
| `liquidity_usd` | `float` | No | Total liquidity in USD |
| `token0` | `array` | No |  |
| `token1` | `array` | No |  |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Pool()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PoolEntity`

Create a new `PoolEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TickerEntity

```php
$ticker = $client->Ticker();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `price_change_24h` | `float` | No | 24-hour price change percentage |
| `price_usd` | `float` | No | Current price in USD |
| `symbol` | `string` | No | Token symbol |
| `timestamp` | `string` | No | Timestamp of ticker data |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Ticker()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TickerEntity`

Create a new `TickerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TokenEntity

```php
$token = $client->Token();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `string` | No | Token contract address |
| `chain` | `string` | No | Blockchain network |
| `decimals` | `int` | No | Token decimal places |
| `id` | `string` | No | Unique token identifier |
| `last_updated` | `string` | No | Timestamp of last data update |
| `liquidity_usd` | `float` | No | Total liquidity in USD |
| `market_cap` | `float` | No | Market capitalization in USD |
| `name` | `string` | No | Token name |
| `price_change_24h` | `float` | No | 24-hour price change percentage |
| `price_usd` | `float` | No | Current price in USD |
| `symbol` | `string` | No | Token symbol |
| `total_supply` | `float` | No | Total token supply |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Token()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Token()->load(["id" => "token_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TokenEntity`

Create a new `TokenEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new DexpaprikaSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```


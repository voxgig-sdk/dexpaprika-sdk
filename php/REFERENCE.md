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

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

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
$exchange = $client->exchange();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->exchange()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): ExchangeEntity`

Create a new `ExchangeEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## HistoricalEntity

```php
$historical = $client->historical();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | ``$ARRAY`` | No |  |
| `token_id` | ``$STRING`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->historical()->load(["id" => "historical_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): HistoricalEntity`

Create a new `HistoricalEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PoolEntity

```php
$pool = $client->pool();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->pool()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PoolEntity`

Create a new `PoolEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## TickerEntity

```php
$ticker = $client->ticker();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->ticker()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): TickerEntity`

Create a new `TickerEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## TokenEntity

```php
$token = $client->token();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->token()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->token()->load(["id" => "token_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): TokenEntity`

Create a new `TokenEntity` instance with the same client and
options.

#### `getName(): string`

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


# Dexpaprika PHP SDK



The PHP SDK for the Dexpaprika API — an entity-oriented client using PHP conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/dexpaprika-sdk/releases](https://github.com/voxgig-sdk/dexpaprika-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'dexpaprika_sdk.php';

$client = new DexpaprikaSDK();
```

### 2. List exchanges

```php
try {
    $result = $client->exchange()->list();
    if (is_array($result)) {
        foreach ($result as $item) {
            $d = $item->data_get();
            echo $d["id"] . " " . $d["name"] . "\n";
        }
    }
} catch (\Exception $err) {
    echo "Error: " . $err->getMessage();
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    echo "Error: " . $result["err"]->getMessage();
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = DexpaprikaSDK::test();

$result = $client->exchange()->load(["id" => "test01"]);
// $result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new DexpaprikaSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
DEXPAPRIKA_TEST_LIVE=TRUE
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### DexpaprikaSDK

```php
require_once 'dexpaprika_sdk.php';
$client = new DexpaprikaSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = DexpaprikaSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### DexpaprikaSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Exchange` | `($data): ExchangeEntity` | Create a Exchange entity instance. |
| `Historical` | `($data): HistoricalEntity` | Create a Historical entity instance. |
| `Pool` | `($data): PoolEntity` | Create a Pool entity instance. |
| `Ticker` | `($data): TickerEntity` | Create a Ticker entity instance. |
| `Token` | `($data): TokenEntity` | Create a Token entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `($reqmatch, $ctrl): array` | List entities matching the criteria. |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `update` | `($reqdata, $ctrl): array` | Update an existing entity. |
| `remove` | `($reqmatch, $ctrl): array` | Remove an entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

### Entities

#### Exchange

| Field | Description |
| --- | --- |
| `chain` |  |
| `id` |  |
| `liquidity_usd` |  |
| `name` |  |
| `trades_24h` |  |
| `volume_24h` |  |

Operations: List.

API path: `/v1/exchanges`

#### Historical

| Field | Description |
| --- | --- |
| `data` |  |
| `token_id` |  |

Operations: Load.

API path: `/v1/historical/{token_id}`

#### Pool

| Field | Description |
| --- | --- |
| `address` |  |
| `apr` |  |
| `chain` |  |
| `dex` |  |
| `id` |  |
| `liquidity_usd` |  |
| `token0` |  |
| `token1` |  |
| `volume_24h` |  |

Operations: List.

API path: `/v1/pools`

#### Ticker

| Field | Description |
| --- | --- |
| `price_change_24h` |  |
| `price_usd` |  |
| `symbol` |  |
| `timestamp` |  |
| `volume_24h` |  |

Operations: List.

API path: `/v1/tickers`

#### Token

| Field | Description |
| --- | --- |
| `address` |  |
| `chain` |  |
| `decimal` |  |
| `id` |  |
| `last_updated` |  |
| `liquidity_usd` |  |
| `market_cap` |  |
| `name` |  |
| `price_change_24h` |  |
| `price_usd` |  |
| `symbol` |  |
| `total_supply` |  |
| `volume_24h` |  |

Operations: List, Load.

API path: `/v1/tokens`



## Entities


### Exchange

Create an instance: `const exchange = client.exchange`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `chain` | ``$STRING`` |  |
| `id` | ``$STRING`` |  |
| `liquidity_usd` | ``$NUMBER`` |  |
| `name` | ``$STRING`` |  |
| `trades_24h` | ``$INTEGER`` |  |
| `volume_24h` | ``$NUMBER`` |  |

#### Example: List

```ts
const exchanges = await client.exchange.list()
```


### Historical

Create an instance: `const historical = client.historical`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | ``$ARRAY`` |  |
| `token_id` | ``$STRING`` |  |

#### Example: Load

```ts
const historical = await client.historical.load({ id: 'historical_id' })
```


### Pool

Create an instance: `const pool = client.pool`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address` | ``$STRING`` |  |
| `apr` | ``$NUMBER`` |  |
| `chain` | ``$STRING`` |  |
| `dex` | ``$STRING`` |  |
| `id` | ``$STRING`` |  |
| `liquidity_usd` | ``$NUMBER`` |  |
| `token0` | ``$OBJECT`` |  |
| `token1` | ``$OBJECT`` |  |
| `volume_24h` | ``$NUMBER`` |  |

#### Example: List

```ts
const pools = await client.pool.list()
```


### Ticker

Create an instance: `const ticker = client.ticker`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `price_change_24h` | ``$NUMBER`` |  |
| `price_usd` | ``$NUMBER`` |  |
| `symbol` | ``$STRING`` |  |
| `timestamp` | ``$STRING`` |  |
| `volume_24h` | ``$NUMBER`` |  |

#### Example: List

```ts
const tickers = await client.ticker.list()
```


### Token

Create an instance: `const token = client.token`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address` | ``$STRING`` |  |
| `chain` | ``$STRING`` |  |
| `decimal` | ``$INTEGER`` |  |
| `id` | ``$STRING`` |  |
| `last_updated` | ``$STRING`` |  |
| `liquidity_usd` | ``$NUMBER`` |  |
| `market_cap` | ``$NUMBER`` |  |
| `name` | ``$STRING`` |  |
| `price_change_24h` | ``$NUMBER`` |  |
| `price_usd` | ``$NUMBER`` |  |
| `symbol` | ``$STRING`` |  |
| `total_supply` | ``$NUMBER`` |  |
| `volume_24h` | ``$NUMBER`` |  |

#### Example: Load

```ts
const token = await client.token.load({ id: 'token_id' })
```

#### Example: List

```ts
const tokens = await client.token.list()
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as the second element in the return array.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── dexpaprika_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`dexpaprika_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```php
$exchange = $client->exchange();
$exchange->load(["id" => "example_id"]);

// $exchange->dataGet() now returns the loaded exchange data
// $exchange->matchGet() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.

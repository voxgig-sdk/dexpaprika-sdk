# Dexpaprika Ruby SDK



The Ruby SDK for the Dexpaprika API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Exchange` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/dexpaprika-sdk/releases](https://github.com/voxgig-sdk/dexpaprika-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Dexpaprika_sdk"

client = DexpaprikaSDK.new
```

### 2. List exchange records

```ruby
begin
  # list returns an Array of Exchange records — iterate directly.
  exchanges = client.Exchange.list
  exchanges.each do |item|
    puts "#{item["id"]} #{item["chain"]}"
  end
rescue => err
  warn "list failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  tickers = client.Ticker.list()
rescue => err
  warn "list failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = DexpaprikaSDK.test

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
ticker = client.Ticker.list()
puts ticker
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = DexpaprikaSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
DEXPAPRIKA_TEST_LIVE=TRUE
```

Then run:

```bash
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### DexpaprikaSDK

```ruby
require_relative "Dexpaprika_sdk"
client = DexpaprikaSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = DexpaprikaSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### DexpaprikaSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `Exchange` | `(data) -> ExchangeEntity` | Create an Exchange entity instance. |
| `Historical` | `(data) -> HistoricalEntity` | Create a Historical entity instance. |
| `Pool` | `(data) -> PoolEntity` | Create a Pool entity instance. |
| `Ticker` | `(data) -> TickerEntity` | Create a Ticker entity instance. |
| `Token` | `(data) -> TokenEntity` | Create a Token entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `DexpaprikaError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

### Entities

#### Exchange

| Field | Description |
| --- | --- |
| `chain` | Blockchain network |
| `id` | Exchange identifier |
| `liquidity_usd` | Total liquidity in USD |
| `name` | Exchange name |
| `trades_24h` | Number of trades in last 24 hours |
| `volume_24h` | 24-hour trading volume |

Operations: List.

API path: `/v1/exchanges`

#### Historical

| Field | Description |
| --- | --- |
| `data` |  |
| `id` |  |
| `token_id` | Token identifier |

Operations: Load.

API path: `/v1/historical/{token_id}`

#### Pool

| Field | Description |
| --- | --- |
| `address` | Pool contract address |
| `apr` | Annual percentage rate |
| `chain` | Blockchain network |
| `dex` | DEX platform name |
| `id` | Unique pool identifier |
| `liquidity_usd` | Total liquidity in USD |
| `token0` |  |
| `token1` |  |
| `volume_24h` | 24-hour trading volume |

Operations: List.

API path: `/v1/pools`

#### Ticker

| Field | Description |
| --- | --- |
| `price_change_24h` | 24-hour price change percentage |
| `price_usd` | Current price in USD |
| `symbol` | Token symbol |
| `timestamp` | Timestamp of ticker data |
| `volume_24h` | 24-hour trading volume |

Operations: List.

API path: `/v1/tickers`

#### Token

| Field | Description |
| --- | --- |
| `address` | Token contract address |
| `chain` | Blockchain network |
| `decimals` | Token decimal places |
| `id` | Unique token identifier |
| `last_updated` | Timestamp of last data update |
| `liquidity_usd` | Total liquidity in USD |
| `market_cap` | Market capitalization in USD |
| `name` | Token name |
| `price_change_24h` | 24-hour price change percentage |
| `price_usd` | Current price in USD |
| `symbol` | Token symbol |
| `total_supply` | Total token supply |
| `volume_24h` | 24-hour trading volume |

Operations: List, Load.

API path: `/v1/tokens`



## Entities


### Exchange

Create an instance: `exchange = client.Exchange`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `chain` | `String` | Blockchain network |
| `id` | `String` | Exchange identifier |
| `liquidity_usd` | `Float` | Total liquidity in USD |
| `name` | `String` | Exchange name |
| `trades_24h` | `Integer` | Number of trades in last 24 hours |
| `volume_24h` | `Float` | 24-hour trading volume |

#### Example: List

```ruby
# list returns an Array of Exchange records (raises on error).
exchanges = client.Exchange.list
```


### Historical

Create an instance: `historical = client.Historical`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `Array` |  |
| `id` | `String` |  |
| `token_id` | `String` | Token identifier |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Historical record (raises on error).
historical = client.Historical.load({ "id" => "historical_id" })
```


### Pool

Create an instance: `pool = client.Pool`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address` | `String` | Pool contract address |
| `apr` | `Float` | Annual percentage rate |
| `chain` | `String` | Blockchain network |
| `dex` | `String` | DEX platform name |
| `id` | `String` | Unique pool identifier |
| `liquidity_usd` | `Float` | Total liquidity in USD |
| `token0` | `Hash` |  |
| `token1` | `Hash` |  |
| `volume_24h` | `Float` | 24-hour trading volume |

#### Example: List

```ruby
# list returns an Array of Pool records (raises on error).
pools = client.Pool.list
```


### Ticker

Create an instance: `ticker = client.Ticker`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `price_change_24h` | `Float` | 24-hour price change percentage |
| `price_usd` | `Float` | Current price in USD |
| `symbol` | `String` | Token symbol |
| `timestamp` | `String` | Timestamp of ticker data |
| `volume_24h` | `Float` | 24-hour trading volume |

#### Example: List

```ruby
# list returns an Array of Ticker records (raises on error).
tickers = client.Ticker.list
```


### Token

Create an instance: `token = client.Token`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address` | `String` | Token contract address |
| `chain` | `String` | Blockchain network |
| `decimals` | `Integer` | Token decimal places |
| `id` | `String` | Unique token identifier |
| `last_updated` | `String` | Timestamp of last data update |
| `liquidity_usd` | `Float` | Total liquidity in USD |
| `market_cap` | `Float` | Market capitalization in USD |
| `name` | `String` | Token name |
| `price_change_24h` | `Float` | 24-hour price change percentage |
| `price_usd` | `Float` | Current price in USD |
| `symbol` | `String` | Token symbol |
| `total_supply` | `Float` | Total token supply |
| `volume_24h` | `Float` | 24-hour trading volume |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Token record (raises on error).
token = client.Token.load({ "id" => "token_id" })
```

#### Example: List

```ruby
# list returns an Array of Token records (raises on error).
tokens = client.Token.list
```

## Features

This SDK ships 1 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`test`](#test) | In-memory mock transport for testing without a live server |

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

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

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── Dexpaprika_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`Dexpaprika_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```ruby
ticker = client.Ticker
ticker.list()

# ticker.data_get now returns the ticker data from the last list
# ticker.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.

# Dexpaprika Ruby SDK



The Ruby SDK for the Dexpaprika API — an entity-oriented client using idiomatic Ruby conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
gem install voxgig-sdk-dexpaprika
```

Or add to your `Gemfile`:

```ruby
gem "voxgig-sdk-dexpaprika"
```

Then run:

```bash
bundle install
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Dexpaprika_sdk"

client = DexpaprikaSDK.new({
  "apikey" => ENV["DEXPAPRIKA_APIKEY"],
})
```

### 2. List exchanges

```ruby
result, err = client.Exchange().list
raise err if err

if result.is_a?(Array)
  result.each do |item|
    d = item.data_get
    puts "#{d["id"]} #{d["name"]}"
  end
end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
raise err if err

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
end
```

### Prepare a request without sending it

```ruby
fetchdef, err = client.prepare({
  "path" => "/api/resource/{id}",
  "method" => "DELETE",
  "params" => { "id" => "example" },
})
raise err if err

puts fetchdef["url"]
puts fetchdef["method"]
puts fetchdef["headers"]
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = DexpaprikaSDK.test

result, err = client.Dexpaprika().load({ "id" => "test01" })
# result contains mock response data
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
DEXPAPRIKA_APIKEY=<your-key>
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
| `apikey` | `String` | API key for authentication. |
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
| `prepare` | `(fetchargs) -> [Hash, err]` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> [Hash, err]` | Build and send an HTTP request. |
| `Exchange` | `(data) -> ExchangeEntity` | Create a Exchange entity instance. |
| `Historical` | `(data) -> HistoricalEntity` | Create a Historical entity instance. |
| `Pool` | `(data) -> PoolEntity` | Create a Pool entity instance. |
| `Ticker` | `(data) -> TickerEntity` | Create a Ticker entity instance. |
| `Token` | `(data) -> TokenEntity` | Create a Token entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> [any, err]` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> [any, err]` | List entities matching the criteria. |
| `create` | `(reqdata, ctrl) -> [any, err]` | Create a new entity. |
| `update` | `(reqdata, ctrl) -> [any, err]` | Update an existing entity. |
| `remove` | `(reqmatch, ctrl) -> [any, err]` | Remove an entity. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `[any, err]`. The first value is a
`Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Create an instance: `const exchange = client.Exchange()`

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
const exchanges = await client.Exchange().list()
```


### Historical

Create an instance: `const historical = client.Historical()`

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
const historical = await client.Historical().load({ id: 'historical_id' })
```


### Pool

Create an instance: `const pool = client.Pool()`

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
const pools = await client.Pool().list()
```


### Ticker

Create an instance: `const ticker = client.Ticker()`

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
const tickers = await client.Ticker().list()
```


### Token

Create an instance: `const token = client.Token()`

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
const token = await client.Token().load({ id: 'token_id' })
```

#### Example: List

```ts
const tokens = await client.Token().list()
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
error is returned to the caller as a second return value.

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

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```ruby
moon = client.Moon
moon.load({ "planet_id" => "earth", "id" => "luna" })

# moon.data_get now returns the loaded moon data
# moon.match_get returns the last match criteria
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

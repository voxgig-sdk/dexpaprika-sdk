# Dexpaprika SDK

Real-time decentralized exchange data covering token prices, liquidity pools, and swaps across 33+ blockchain networks

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About DexPaprika API

DexPaprika is a public REST API for on-chain decentralized exchange (DEX) data, developed by the team behind [CoinPaprika](https://coinpaprika.com). It exposes token prices, liquidity pool state, and swap-level transactions across more than 33 blockchain networks from a single endpoint at `https://api.dexpaprika.com`.

What you get from the API:

- Token data: latest USD price, 24h high/low, all-time high, fully diluted market cap, liquidity, and buy/sell activity
- Pool data: reserves, fee tiers, transaction history, and filtering by volume, transactions, or creation date
- Swap-level transactions with pagination and timing
- Network metadata listing all supported chains via `GET /networks`
- Optional Server-Sent Events streaming feeds at `streaming.dexpaprika.com` for per-second token prices and block-level reserve deltas

The public API requires no API key or registration. A paid Pro tier is offered for higher throughput and dedicated infrastructure. CORS is disabled on the public endpoint, so calls are typically made server-side.

## Try it

**TypeScript**
```bash
npm install dexpaprika
```

**Python**
```bash
pip install dexpaprika-sdk
```

**PHP**
```bash
composer require voxgig/dexpaprika-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/dexpaprika-sdk/go
```

**Ruby**
```bash
gem install dexpaprika-sdk
```

**Lua**
```bash
luarocks install dexpaprika-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { DexpaprikaSDK } from 'dexpaprika'

const client = new DexpaprikaSDK({})

// List all exchanges
const exchanges = await client.Exchange().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o dexpaprika-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "dexpaprika": {
      "command": "/abs/path/to/dexpaprika-mcp"
    }
  }
}
```

## Entities

The API exposes 5 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Exchange** | Decentralized exchange venues (DEXes) running on each supported blockchain network | `/v1/exchanges` |
| **Historical** | Historical price and volume series for tokens and pools | `/v1/historical/{token_id}` |
| **Pool** | Liquidity pool resources exposing reserves, fee tiers, and swap history, e.g. `GET /networks/{network_id}/pools/{pool_id}` | `/v1/pools` |
| **Ticker** | Per-token quote snapshots including USD price, 24h high/low, market cap, and trading volume | `/v1/tickers` |
| **Token** | On-chain token resources keyed by network and contract address, e.g. `GET /networks/{network_id}/tokens/{address}` | `/v1/tokens` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from dexpaprika_sdk import DexpaprikaSDK

client = DexpaprikaSDK({})

# List all exchanges
exchanges, err = client.Exchange(None).list(None, None)
```

### PHP

```php
<?php
require_once 'dexpaprika_sdk.php';

$client = new DexpaprikaSDK([]);

// List all exchanges
[$exchanges, $err] = $client->Exchange(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/dexpaprika-sdk/go"

client := sdk.NewDexpaprikaSDK(map[string]any{})

// List all exchanges
exchanges, err := client.Exchange(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "Dexpaprika_sdk"

client = DexpaprikaSDK.new({})

# List all exchanges
exchanges, err = client.Exchange(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("dexpaprika_sdk")

local client = sdk.new({})

-- List all exchanges
local exchanges, err = client:Exchange(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = DexpaprikaSDK.test()
const result = await client.Exchange().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = DexpaprikaSDK.test(None, None)
result, err = client.Exchange(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = DexpaprikaSDK::test(null, null);
[$result, $err] = $client->Exchange(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Exchange(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = DexpaprikaSDK.test(nil, nil)
result, err = client.Exchange(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Exchange(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the DexPaprika API

- Upstream: [https://dexpaprika.com](https://dexpaprika.com)
- API docs: [https://docs.dexpaprika.com/](https://docs.dexpaprika.com/)

---

Generated from the DexPaprika API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

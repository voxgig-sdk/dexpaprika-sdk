# Dexpaprika Python SDK Reference

Complete API reference for the Dexpaprika Python SDK.


## DexpaprikaSDK

### Constructor

```python
from dexpaprika_sdk import DexpaprikaSDK

client = DexpaprikaSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DexpaprikaSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = DexpaprikaSDK.test()
```


### Instance Methods

#### `Exchange(data=None)`

Create a new `ExchangeEntity` instance. Pass `None` for no initial data.

#### `Historical(data=None)`

Create a new `HistoricalEntity` instance. Pass `None` for no initial data.

#### `Pool(data=None)`

Create a new `PoolEntity` instance. Pass `None` for no initial data.

#### `Ticker(data=None)`

Create a new `TickerEntity` instance. Pass `None` for no initial data.

#### `Token(data=None)`

Create a new `TokenEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## ExchangeEntity

```python
exchange = client.Exchange()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `chain` | `str` | No | Blockchain network |
| `id` | `str` | No | Exchange identifier |
| `liquidity_usd` | `float` | No | Total liquidity in USD |
| `name` | `str` | No | Exchange name |
| `trades_24h` | `int` | No | Number of trades in last 24 hours |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Exchange().list()
for exchange in results:
    print(exchange)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ExchangeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## HistoricalEntity

```python
historical = client.Historical()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `list` | No |  |
| `id` | `str` | No |  |
| `token_id` | `str` | No | Token identifier |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Historical().load({"id": "historical_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HistoricalEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PoolEntity

```python
pool = client.Pool()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `str` | No | Pool contract address |
| `apr` | `float` | No | Annual percentage rate |
| `chain` | `str` | No | Blockchain network |
| `dex` | `str` | No | DEX platform name |
| `id` | `str` | No | Unique pool identifier |
| `liquidity_usd` | `float` | No | Total liquidity in USD |
| `token0` | `dict` | No |  |
| `token1` | `dict` | No |  |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Pool().list()
for pool in results:
    print(pool)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PoolEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TickerEntity

```python
ticker = client.Ticker()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `price_change_24h` | `float` | No | 24-hour price change percentage |
| `price_usd` | `float` | No | Current price in USD |
| `symbol` | `str` | No | Token symbol |
| `timestamp` | `str` | No | Timestamp of ticker data |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Ticker().list()
for ticker in results:
    print(ticker)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TickerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TokenEntity

```python
token = client.Token()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `str` | No | Token contract address |
| `chain` | `str` | No | Blockchain network |
| `decimals` | `int` | No | Token decimal places |
| `id` | `str` | No | Unique token identifier |
| `last_updated` | `str` | No | Timestamp of last data update |
| `liquidity_usd` | `float` | No | Total liquidity in USD |
| `market_cap` | `float` | No | Market capitalization in USD |
| `name` | `str` | No | Token name |
| `price_change_24h` | `float` | No | 24-hour price change percentage |
| `price_usd` | `float` | No | Current price in USD |
| `symbol` | `str` | No | Token symbol |
| `total_supply` | `float` | No | Total token supply |
| `volume_24h` | `float` | No | 24-hour trading volume |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Token().list()
for token in results:
    print(token)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Token().load({"id": "token_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TokenEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = DexpaprikaSDK({
    "feature": {
        "test": {"active": True},
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


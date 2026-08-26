<?php
declare(strict_types=1);

// Dexpaprika SDK configuration

class DexpaprikaConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Dexpaprika",
                "slug" => "dexpaprika",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
            ],
            "options" => [
                "base" => "https://api.dexpaprika.com",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "exchange" => [],
                    "historical" => [],
                    "pool" => [],
                    "ticker" => [],
                    "token" => [],
                ],
            ],
            "entity" => [
        'exchange' => [
          'fields' => [
            [
              'name' => 'chain',
              'short' => 'Blockchain network',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'id',
              'short' => 'Exchange identifier',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'liquidity_usd',
              'short' => 'Total liquidity in USD',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'name',
              'short' => 'Exchange name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'trades_24h',
              'short' => 'Number of trades in last 24 hours',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'volume_24h',
              'short' => '24-hour trading volume',
              'type' => '`$NUMBER`',
            ],
          ],
          'name' => 'exchange',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/exchanges',
                  'parts' => [
                    'v1',
                    'exchanges',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'historical' => [
          'fields' => [
            [
              'name' => 'data',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'id',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'token_id',
              'short' => 'Token identifier',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'historical',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'token_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'end',
                        'orig' => 'end',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => '1h',
                        'kind' => 'query',
                        'name' => 'interval',
                        'orig' => 'interval',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'start',
                        'orig' => 'start',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/historical/{token_id}',
                  'parts' => [
                    'v1',
                    'historical',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'token_id' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'end',
                      'id',
                      'interval',
                      'start',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'pool' => [
          'fields' => [
            [
              'name' => 'address',
              'short' => 'Pool contract address',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'apr',
              'short' => 'Annual percentage rate',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'chain',
              'short' => 'Blockchain network',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'dex',
              'short' => 'DEX platform name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'id',
              'short' => 'Unique pool identifier',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'liquidity_usd',
              'short' => 'Total liquidity in USD',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'token0',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'token1',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'volume_24h',
              'short' => '24-hour trading volume',
              'type' => '`$NUMBER`',
            ],
          ],
          'name' => 'pool',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'dex',
                        'orig' => 'dex',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 100,
                        'kind' => 'query',
                        'name' => 'limit',
                        'orig' => 'limit',
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/pools',
                  'parts' => [
                    'v1',
                    'pools',
                  ],
                  'select' => [
                    'exist' => [
                      'dex',
                      'limit',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'ticker' => [
          'fields' => [
            [
              'name' => 'price_change_24h',
              'short' => '24-hour price change percentage',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'price_usd',
              'short' => 'Current price in USD',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'symbol',
              'short' => 'Token symbol',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'timestamp',
              'short' => 'Timestamp of ticker data',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'volume_24h',
              'short' => '24-hour trading volume',
              'type' => '`$NUMBER`',
            ],
          ],
          'name' => 'ticker',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'symbol',
                        'orig' => 'symbol',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/tickers',
                  'parts' => [
                    'v1',
                    'tickers',
                  ],
                  'select' => [
                    'exist' => [
                      'symbol',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'token' => [
          'fields' => [
            [
              'name' => 'address',
              'short' => 'Token contract address',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'chain',
              'short' => 'Blockchain network',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'decimals',
              'short' => 'Token decimal places',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'id',
              'short' => 'Unique token identifier',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'last_updated',
              'short' => 'Timestamp of last data update',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'liquidity_usd',
              'short' => 'Total liquidity in USD',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'market_cap',
              'short' => 'Market capitalization in USD',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'name',
              'short' => 'Token name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'price_change_24h',
              'short' => '24-hour price change percentage',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'price_usd',
              'short' => 'Current price in USD',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'symbol',
              'short' => 'Token symbol',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'total_supply',
              'short' => 'Total token supply',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'volume_24h',
              'short' => '24-hour trading volume',
              'type' => '`$NUMBER`',
            ],
          ],
          'name' => 'token',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'chain',
                        'orig' => 'chain',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 100,
                        'kind' => 'query',
                        'name' => 'limit',
                        'orig' => 'limit',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'example' => 0,
                        'kind' => 'query',
                        'name' => 'offset',
                        'orig' => 'offset',
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/tokens',
                  'parts' => [
                    'v1',
                    'tokens',
                  ],
                  'select' => [
                    'exist' => [
                      'chain',
                      'limit',
                      'offset',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'token_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v1/tokens/{token_id}',
                  'parts' => [
                    'v1',
                    'tokens',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'token_id' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return DexpaprikaFeatures::make_feature($name);
    }
}

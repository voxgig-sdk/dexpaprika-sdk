# Exchange entity test

require "minitest/autorun"
require "json"
require_relative "../Dexpaprika_sdk"
require_relative "runner"

class ExchangeEntityTest < Minitest::Test
  def test_create_instance
    testsdk = DexpaprikaSDK.test(nil, nil)
    ent = testsdk.Exchange(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = exchange_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["list"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "exchange." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set DEXPAPRIKA_TEST_EXCHANGE_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    exchange_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.exchange")))
    exchange_ref01_data = nil
    if exchange_ref01_data_raw.length > 0
      exchange_ref01_data = Helpers.to_map(exchange_ref01_data_raw[0][1])
    end

    # LIST
    exchange_ref01_ent = client.Exchange(nil)
    exchange_ref01_match = {}

    exchange_ref01_list_result, err = exchange_ref01_ent.list(exchange_ref01_match, nil)
    assert_nil err
    assert exchange_ref01_list_result.is_a?(Array)

  end
end

def exchange_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "exchange", "ExchangeTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = DexpaprikaSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["exchange01", "exchange02", "exchange03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["DEXPAPRIKA_TEST_EXCHANGE_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "DEXPAPRIKA_TEST_EXCHANGE_ENTID" => idmap,
    "DEXPAPRIKA_TEST_LIVE" => "FALSE",
    "DEXPAPRIKA_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["DEXPAPRIKA_TEST_EXCHANGE_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["DEXPAPRIKA_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = DexpaprikaSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["DEXPAPRIKA_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["DEXPAPRIKA_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end

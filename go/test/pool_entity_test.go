package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/dexpaprika-sdk/go"
	"github.com/voxgig-sdk/dexpaprika-sdk/go/core"

	vs "github.com/voxgig-sdk/dexpaprika-sdk/go/utility/struct"
)

func TestPoolEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Pool(nil)
		if ent == nil {
			t.Fatal("expected non-nil PoolEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := poolBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "pool." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set DEXPAPRIKA_TEST_POOL_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		poolRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.pool", setup.data)))
		var poolRef01Data map[string]any
		if len(poolRef01DataRaw) > 0 {
			poolRef01Data = core.ToMapAny(poolRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = poolRef01Data

		// LIST
		poolRef01Ent := client.Pool(nil)
		poolRef01Match := map[string]any{}

		poolRef01ListResult, err := poolRef01Ent.List(poolRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, poolRef01ListOk := poolRef01ListResult.([]any)
		if !poolRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", poolRef01ListResult)
		}

	})
}

func poolBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "pool", "PoolTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read pool test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse pool test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"pool01", "pool02", "pool03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("DEXPAPRIKA_TEST_POOL_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"DEXPAPRIKA_TEST_POOL_ENTID": idmap,
		"DEXPAPRIKA_TEST_LIVE":      "FALSE",
		"DEXPAPRIKA_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["DEXPAPRIKA_TEST_POOL_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["DEXPAPRIKA_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
			},
			extra,
		})
		client = sdk.NewDexpaprikaSDK(core.ToMapAny(mergedOpts))
	}

	live := env["DEXPAPRIKA_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["DEXPAPRIKA_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}

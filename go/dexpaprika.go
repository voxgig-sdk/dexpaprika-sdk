package voxgigdexpaprikasdk

import (
	"github.com/voxgig-sdk/dexpaprika-sdk/go/core"
	"github.com/voxgig-sdk/dexpaprika-sdk/go/entity"
	"github.com/voxgig-sdk/dexpaprika-sdk/go/feature"
	_ "github.com/voxgig-sdk/dexpaprika-sdk/go/utility"
)

// Type aliases preserve external API.
type DexpaprikaSDK = core.DexpaprikaSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type DexpaprikaEntity = core.DexpaprikaEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type DexpaprikaError = core.DexpaprikaError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewExchangeEntityFunc = func(client *core.DexpaprikaSDK, entopts map[string]any) core.DexpaprikaEntity {
		return entity.NewExchangeEntity(client, entopts)
	}
	core.NewHistoricalEntityFunc = func(client *core.DexpaprikaSDK, entopts map[string]any) core.DexpaprikaEntity {
		return entity.NewHistoricalEntity(client, entopts)
	}
	core.NewPoolEntityFunc = func(client *core.DexpaprikaSDK, entopts map[string]any) core.DexpaprikaEntity {
		return entity.NewPoolEntity(client, entopts)
	}
	core.NewTickerEntityFunc = func(client *core.DexpaprikaSDK, entopts map[string]any) core.DexpaprikaEntity {
		return entity.NewTickerEntity(client, entopts)
	}
	core.NewTokenEntityFunc = func(client *core.DexpaprikaSDK, entopts map[string]any) core.DexpaprikaEntity {
		return entity.NewTokenEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewDexpaprikaSDK = core.NewDexpaprikaSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature

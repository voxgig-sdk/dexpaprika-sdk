package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewExchangeEntityFunc func(client *DexpaprikaSDK, entopts map[string]any) DexpaprikaEntity

var NewHistoricalEntityFunc func(client *DexpaprikaSDK, entopts map[string]any) DexpaprikaEntity

var NewPoolEntityFunc func(client *DexpaprikaSDK, entopts map[string]any) DexpaprikaEntity

var NewTickerEntityFunc func(client *DexpaprikaSDK, entopts map[string]any) DexpaprikaEntity

var NewTokenEntityFunc func(client *DexpaprikaSDK, entopts map[string]any) DexpaprikaEntity


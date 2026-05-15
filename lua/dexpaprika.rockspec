package = "voxgig-sdk-dexpaprika"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/dexpaprika-sdk.git"
}
description = {
  summary = "Dexpaprika SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["dexpaprika_sdk"] = "dexpaprika_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}

-- Dexpaprika SDK error

local DexpaprikaError = {}
DexpaprikaError.__index = DexpaprikaError


function DexpaprikaError.new(code, msg, ctx)
  local self = setmetatable({}, DexpaprikaError)
  self.is_sdk_error = true
  self.sdk = "Dexpaprika"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function DexpaprikaError:error()
  return self.msg
end


function DexpaprikaError:__tostring()
  return self.msg
end


return DexpaprikaError

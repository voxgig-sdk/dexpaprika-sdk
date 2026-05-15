# Dexpaprika SDK utility: make_context
require_relative '../core/context'
module DexpaprikaUtilities
  MakeContext = ->(ctxmap, basectx) {
    DexpaprikaContext.new(ctxmap, basectx)
  }
end

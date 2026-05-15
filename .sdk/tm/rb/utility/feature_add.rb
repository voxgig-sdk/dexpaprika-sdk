# Dexpaprika SDK utility: feature_add
module DexpaprikaUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end

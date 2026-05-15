# Dexpaprika SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module DexpaprikaFeatures
  def self.make_feature(name)
    case name
    when "base"
      DexpaprikaBaseFeature.new
    when "test"
      DexpaprikaTestFeature.new
    else
      DexpaprikaBaseFeature.new
    end
  end
end

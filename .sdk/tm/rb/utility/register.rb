# Dexpaprika SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

DexpaprikaUtility.registrar = ->(u) {
  u.clean = DexpaprikaUtilities::Clean
  u.done = DexpaprikaUtilities::Done
  u.make_error = DexpaprikaUtilities::MakeError
  u.feature_add = DexpaprikaUtilities::FeatureAdd
  u.feature_hook = DexpaprikaUtilities::FeatureHook
  u.feature_init = DexpaprikaUtilities::FeatureInit
  u.fetcher = DexpaprikaUtilities::Fetcher
  u.make_fetch_def = DexpaprikaUtilities::MakeFetchDef
  u.make_context = DexpaprikaUtilities::MakeContext
  u.make_options = DexpaprikaUtilities::MakeOptions
  u.make_request = DexpaprikaUtilities::MakeRequest
  u.make_response = DexpaprikaUtilities::MakeResponse
  u.make_result = DexpaprikaUtilities::MakeResult
  u.make_point = DexpaprikaUtilities::MakePoint
  u.make_spec = DexpaprikaUtilities::MakeSpec
  u.make_url = DexpaprikaUtilities::MakeUrl
  u.param = DexpaprikaUtilities::Param
  u.prepare_auth = DexpaprikaUtilities::PrepareAuth
  u.prepare_body = DexpaprikaUtilities::PrepareBody
  u.prepare_headers = DexpaprikaUtilities::PrepareHeaders
  u.prepare_method = DexpaprikaUtilities::PrepareMethod
  u.prepare_params = DexpaprikaUtilities::PrepareParams
  u.prepare_path = DexpaprikaUtilities::PreparePath
  u.prepare_query = DexpaprikaUtilities::PrepareQuery
  u.result_basic = DexpaprikaUtilities::ResultBasic
  u.result_body = DexpaprikaUtilities::ResultBody
  u.result_headers = DexpaprikaUtilities::ResultHeaders
  u.transform_request = DexpaprikaUtilities::TransformRequest
  u.transform_response = DexpaprikaUtilities::TransformResponse
}

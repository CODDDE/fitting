module Fitting
  class Configuration
    attr_accessor :apib_path,
                  :drafter_yaml_path,
                  :strict,
                  :prefix,
                  :white_list,
                  :resource_white_list,
                  :json_schema_cover

    def initialize
      @strict = false
      @prefix = ''
      @json_schema_cover = false
    end
  end
end

require 'fitting/route'

module Fitting
  class Statistics
    def initialize(documentation, all_responses)
      @documentation = documentation
      @black_route = Fitting::Route.new(all_responses, @documentation.black)
      @white_route = Fitting::Route.new(all_responses, @documentation.white)
    end

    def not_coverage?
      @white_route.not_coverage.present?
    end

    def save(name)
      File.open(name, 'w') { |file| file.write(to_s) }
    end

    def to_s
      if @documentation.black.any?
        [
          ['[Black list]', @black_route.statistics].join("\n"),
          ['[White list]', @white_route.statistics_with_conformity_lists].join("\n"),
          ""
        ].join("\n\n")
      else
        [@white_route.statistics_with_conformity_lists, "\n\n"].join
      end
    end
  end
end
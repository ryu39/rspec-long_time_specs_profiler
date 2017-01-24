require 'rspec'
require 'rspec/core/formatters/base_text_formatter'

module RSpec
  class LongTimeSpecsProfiler < RSpec::Core::Formatters::BaseTextFormatter
    VERSION = '0.1.0'

    # Override RSpec::Core::Formatters::BaseTextFormatter#dump_profile
    def dump_profile
      dump_profile_long_time_spec_files
    end

    private

    def dump_profile_long_time_spec_files
      number_of_examples = RSpec.configuration.profile_examples
      examples_group_by_location = examples.group_by do |example|
        example.example_group.parent_groups.last.metadata[:example_group][:location]
      end

      return if examples_group_by_location.length <= 1

      stats = examples_group_by_location.map { |location, examples| Stat.new(location, examples) }
      sorted_stats = stats.sort_by(&:total_time).reverse

      output.puts "\nTop #{number_of_examples} longest time spec files:"
      sorted_stats.first(number_of_examples).each do |stat|
        total = "#{failure_color(format_seconds(stat.total_time))} #{failure_color("seconds")}"
        count = pluralize(stat.count, "example")
        output.puts "  #{stat.description}"
        output.puts detail_color("    #{total} ( #{count} ) #{stat.location}")
      end
    end

    class Stat
      def initialize(location, examples)
        @location = location
        @count = examples.length
        @total_time = examples.inject(0.0) { |total, e| total + e.execution_result[:run_time] }
        @description = examples.first.example_group.top_level_description unless examples.empty?
      end

      attr_reader :location, :count, :total_time, :description
    end
  end
end

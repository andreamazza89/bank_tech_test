require_relative '../lib/account.rb'
require_relative '../lib/terminal_printer.rb'
require 'timecop'

Timecop.freeze(Time.local(2012, 01, 10))

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus
end

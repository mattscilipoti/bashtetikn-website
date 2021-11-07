require 'rails_helper'
require_relative '../shared/shared_examples_for_page_scans'

RSpec.describe PageScan, type: :model do
  it_behaves_like 'Any PageScan'
end

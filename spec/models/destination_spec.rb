require 'spec_helper'

describe Destination do
  it { should belong_to(:traveller) }
end

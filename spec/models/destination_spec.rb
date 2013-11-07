require 'spec_helper'

describe Destination do
  it { should belong_to(:traveller) }
  it { should have_many(:to_dos) }
end

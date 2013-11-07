require 'spec_helper'

describe Traveller do
  it { should have_many(:destinations) }
end
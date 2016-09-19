require 'spec_helper'
describe 'network_address' do
  context 'with default values for all parameters' do
    it { should contain_class('network_address') }
  end
end

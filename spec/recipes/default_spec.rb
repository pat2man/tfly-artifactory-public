require_relative '../spec_helper'

describe 'tfly-artifactory::default' do

  let(:chef_run) {
    chef_run = ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  }

  
  it 'does nothing' do
  	## put your chefspec assertions here
  	## https://docs.getchef.com/chefspec.html
  end

end
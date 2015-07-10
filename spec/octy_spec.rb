require 'spec_helper'

describe Octy do

  describe 'version' do
    it 'has a version number' do
      expect(Octy::VERSION).not_to be nil
    end
  end

end

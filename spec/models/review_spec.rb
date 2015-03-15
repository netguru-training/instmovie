require 'rails_helper'

describe Review do
  describe 'validations' do
    it { is_expected.to validate_presence_of :content }
  end
end

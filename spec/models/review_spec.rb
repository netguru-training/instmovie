require 'rails_helper'

describe Review do
  describe 'validations' do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :rating }
  end
end

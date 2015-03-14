require 'rails_helper'

describe UserDecorator do
  let(:user) { build(:user, username: nil, email: 'mail@example.com') }


  describe '#identity' do
    it 'displays user mail if username empty' do
      expect(user.decorate.identity).to eq 'mail@example.com'
    end

    it 'displays username if it present' do
      user.username = 'Tom'
      expect(user.decorate.identity).to eq user.username
    end
  end
end

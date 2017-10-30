# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string           not null
#  password_digest  :string           not null
#  session_token    :string           not null
#  activated        :boolean          default(FALSE), not null
#  activation_token :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      email: 'truong@gmail.com',
      password: 'password123')
  end

  describe 'validations' do

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

  end

  describe '#is_password?' do
    it 'should return true if the password matches' do
      expect(user.is_password?('password123')).to be true
    end

    it 'should return false if the password doesn\'t match' do
      expect(user.is_password?('pizza2343')).to be false
    end

  end

  describe "#reset_session_token!" do
      it "sets a new session token on the user" do
        user.valid?
        old_session_token = user.session_token
        user.reset_session_token!

        expect(user.session_token).to_not eq(old_session_token)
      end

      it "returns the new session token" do
        expect(user.reset_session_token!).to eq(user.session_token)
      end
    end

  describe 'class methods' do
    before {user.save!}
    
    describe '::find_by_credentials' do
      it 'should find a user by credentials' do
        expect(User.find_by_credentials("truong@gmail.com","password123")).to eq(user)
      end
    end
  end



end



# Next, it's time for a review of plain old RSpec!
# Write methods to test #is_password?,
# reset_session_token, and ::find_by_credentials.

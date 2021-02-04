require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.create(username: 'Test User', email: 'test@test.com') }
  let(:user2) { User.create }
  let(:user3) { User.create(username: '') }
  let(:user4) { User.create(username: '', email: '') }
  let(:user5) { User.create(username: 'ripping', email: '') }
  let(:user5) { User.create(username: '', email: 'ripping@gmam.com') }

  it 'Checks validity of user1' do
    expect(user1.valid?).to be true
  end

  it 'Checks validity of user2 without username and email' do
    expect(user2.valid?).to be false
  end

  it 'Checks validity of user3 with empty username' do
    expect(user3.valid?).to be false
  end

  it 'Checks validity of user4 with empty username and email' do
    expect(user4.valid?).to be false
  end

  it 'Checks validity of user5 with empty email' do
    expect(user5.valid?).to be false
  end

  it 'Checks validity of user4 with same name as user1' do
    User.create(username: 'Test User')
    expect(User.create(username: 'Test User').valid?).to be false
  end
end

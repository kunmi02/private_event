require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  it 'Test if attendance is valid' do
    creator = User.create(username: 'Test User', email: 'test@test.com')
    attendee = User.create(username: 'Test User', email: 'test@test.com')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    attendance = UserEvent.create(user_id: attendee.id, event_id: event.id)
    expect(attendance.valid?).to be true
  end

  it 'Test if attendance without attendee_id and event_id is valid' do
    attendance = UserEvent.create
    expect(attendance.valid?).to be false
  end

  it 'Test if invitation without attendee_id valid' do
    creator = User.create(username: 'Test User', email: 'test@test.com')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    attendance = UserEvent.create(event_id: event.id)
    expect(attendance.valid?).to be false
  end

  it 'Test if invitation without event_id is valid' do
    attendee = User.create(username: 'Test User', email: 'test@test.com')
    attendance = UserEvent.create(user_id: attendee.id)
    expect(attendance.valid?).to be false
  end

  it 'Test if user is already attending event' do
    creator = User.create(username: 'Test User', email: 'test@test.com')
    attendee = User.create(username: 'Test User', email: 'test@test.com')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    UserEvent.create(user_id: attendee.id, event_id: event.id)
    attendance2 = UserEvent.create(user_id: attendee.id, event_id: event.id)
    expect(attendance2.valid?).to be false
  end

  it 'Test if user already belongs to attendees of event' do
    creator = User.create(username: 'Test User', email: 'test@test.com')
    attendee = User.create(username: 'Test User', email: 'test@test.com')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    UserEvent.create(user_id: attendee.id, event_id: event.id)
    expect(event.attendees.include?(attendee)).to be true
  end

  it 'Test if user has current event in invited events' do
    creator = User.create(username: 'Test User', email: 'test@test.com')
    attendee = User.create(username: 'Test User', email: 'test@test.com')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    UserEvent.create(user_id: attendee.id, event_id: event.id)
    expect(attendee.attended_events.include?(event)).to be true
  end
end

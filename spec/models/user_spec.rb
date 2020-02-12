require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: "Marty", email: "Marty@test.com", password: "donuts")}
    before { subject.save }

    it 'should have a name' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'should have an email address' do
        subject.email = nil
        expect(subject).to_not be_valid
    end

    it 'is invalid when the email is already in use' do
        User.create(name: "Nikki", email: "nikki@test.com", password: "donuts")
        user2 = User.new(name: "Nikki2", email: "nikki@test.com", password: "donuts")
        expect(user2).to_not be_valid
    end

    it 'should have a password' do
        subject.password = nil
        expect(subject).to_not be_valid
    end
end
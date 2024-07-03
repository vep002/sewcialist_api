require 'rails_helper'

RSpec.describe User, type: :model do
    let(:valid_attributes) do
        {
            email: 'test@example.com',
            name: 'testuser',
            password: 'password',
            password_confirmation: 'password',
            role: 0,
            jti: SecureRandom.uuid
        }
    end

    it 'is valid with valid attributes' do
        user = User.new(valid_attributes)
        expect(user).to be_valid
    end

    it 'is not valid without an email' do
        user = User.new(valid_attributes.except(:email))
        expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
        User.create(valid_attributes)
        user = User.new(valid_attributes)
        expect(user).not_to be_valid
    end

    it 'is not valid with an invalid email' do
        user = User.new(valid_attributes.merge(email: 'invalid_email'))
        expect(user).not_to be_valid
    end

    it 'is not valid without a username' do
        user = User.new(valid_attributes.except(:name))
        expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate username' do
        User.create(valid_attributes)
        user = User.new(valid_attributes.merge(email: 'different@example.com'))
        expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
        user = User.new(valid_attributes.except(:password))
        expect(user).not_to be_valid
    end

    it 'is not valid with a short password' do
        user = User.new(valid_attributes.merge(password: 'short', password_confirmation: 'short'))
        expect(user).not_to be_valid
    end

    it 'is not valid with a confirmation mismatch' do
        user = User.new(valid_attributes.merge(password_confirmation: 'mismatch'))
        expect(user).not_to be_valid
    end

    it 'is not valid without a role' do
        user = User.new(valid_attributes.except(:role))
        expect(user).not_to be_valid
    end

    it 'is not valid with a role outside the allowed range' do
        user = User.new(valid_attributes.merge(role: 3))
        expect(user).not_to be_valid
    end

    it 'is not valid without a jti' do
        user = User.new(valid_attributes.except(:jti))
        expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate jti' do
        User.create(valid_attributes)
        user = User.new(valid_attributes.merge(email: 'different@example.com', jti: valid_attributes[:jti]))
        expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate resret_password_token' do
        User.create(valid_attributes.merge(reset_password_token: 'token123'))
        user = User.new(valid_attributes.merge(email: 'different@example.com', reset_password_token: 'token123'))
        expect(user).not_to be_valid
    end
end
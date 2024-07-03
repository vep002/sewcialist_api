require 'rails_helper'

RSpec.describe Project, type: :model do
    let(:user) { User.create(email: 'test@example.com', password: 'password') }

    it 'is valid with valid attributes' do
        project= Project.new(title: 'Test Project', description: 'This is a test project', status: 0, user: user)
        expect(project).to be_valid
    end

    it 'is not valid without a title' do
        project = Project.new(title: nil, description: 'This is a test project', status: 0, user: user)
        expect(project).not_to be_valid
    end

    it 'is not valid without a description' do
        project = Project.new(title: 'Test Project', description: nil, status: 0, user: user)
        expect(project).not_to be_valid
    end

    it 'is not valid without a status' do
        project = Project.new(title: 'Test Project', description: 'This is a test project', status: nil, user: user)
        expect(project).not_to be_valid
    end

    it 'is not valid with a status outside the allowed range' do
        project = Project.new(title: 'Test Project', description: 'This is a test project', status: 3, user: user)
        expect(project).not_to be_valid
    end

    it 'is not valid without a user' do
        project = Project.new(title: 'Test Project', description: 'This is a test project', status: 0, user: nil)
        expect(project).not_to be_valid
    end
end

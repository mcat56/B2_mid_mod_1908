require 'rails_helper'

describe Instructor do

  describe 'attributes' do
    it 'has attributes' do
      instructor = Instructor.new(name: 'Dolores')

      expect(instructor.name).to eq('Dolores')
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :students }
  end
end

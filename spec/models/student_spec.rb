require 'rails_helper'

describe Student do

  describe 'attributes' do
    it 'has_attributes' do
      student = Student.new(name: 'Korey', cohort: '1408', age: 26 )

      expect(student.name).to eq('Korey')
      expect(student.cohort).to eq('1408')
      expect(student.age).to eq(26)
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should belong_to :instructor }
  end
end

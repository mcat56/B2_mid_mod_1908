class Student < ApplicationRecord
  validates_presence_of :name, :cohort, :age
  belongs_to :instructor

end

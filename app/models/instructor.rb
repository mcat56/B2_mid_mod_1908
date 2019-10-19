class Instructor < ApplicationRecord
  validates_presence_of :name
  has_many :students

  def average_student_age
    students.average(:age)
  end
end

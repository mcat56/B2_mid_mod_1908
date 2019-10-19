require 'rails_helper'

describe 'As a visitor' do
  describe 'I visit the student index page' do
    it 'displays all students and their information' do
      instructor = Instructor.create!(name: 'Ian')
      student_1 = instructor.students.create!(name: 'Louisa', cohort: '1506', age: 29)
      student_2 = instructor.students.create!(name: 'Daniel', cohort: '1405', age: 24)
      student_3 = instructor.students.create!(name: 'James', cohort: '1708', age: 31)

      visit '/students'

      within "#students-#{student_1.id}" do
        expect(page).to have_content('Louisa')
        expect(page).to have_content('Cohort: 1506')
        expect(page).to have_content('Age: 29')
        expect(page).to have_content('Instructor: ')
        expect(page).to have_link('Ian')
      end

      within "#students-#{student_2.id}" do
        expect(page).to have_content('Daniel')
        expect(page).to have_content('Cohort: 1405')
        expect(page).to have_content('Age: 24')
        expect(page).to have_content('Instructor: ')
        expect(page).to have_link('Ian')
      end

      within "#students-#{student_3.id}" do
        expect(page).to have_content('James')
        expect(page).to have_content('Cohort: 1708')
        expect(page).to have_content('Age: 31')
        expect(page).to have_content('Instructor: ')
        expect(page).to have_link('Ian')
      end

    end
  end
end

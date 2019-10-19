require 'rails_helper'

describe 'Instructor show page' do
  describe 'I link from the student index page' do
    it 'displays the instructor information and their students and the average age of their students' do
      instructor = Instructor.create!(name: 'Ian')
      student_1 = instructor.students.create!(name: 'Louisa', cohort: '1506', age: 29)
      student_2 = instructor.students.create!(name: 'Daniel', cohort: '1405', age: 24)
      student_3 = instructor.students.create!(name: 'Ada', cohort: '1708', age: 31)

      visit '/students'


      within "#students-#{student_3.id}" do
        click_link 'Ian'
      end

      expect(current_path).to eq("/instructors/#{instructor.id}")

      expect(page).to have_content('Ian')

      within '#students' do
        expect(page).to have_content('Students:')
        expect(page).to have_content('Louisa')
        expect(page).to have_content('Daniel')
        expect(page).to have_content('Ada')
        expect(page).to have_content('Average Age: 28')
      end

    end
  end
end

require 'rails_helper'
# removed: replaced by request specs
RSpec.describe 'classroom_show_view', type: :view do
  let(:classroom) { Classroom.create(course_name: 'Math', semester: "Spring #{Time.now.year}") }
  let(:student) { Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago)) }

  before do
    5.times do
      Student.create(name: Faker::Name.name, hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
    end
    Student.all.each do |student|
      ClassroomStudent.create(student: student, classroom: classroom)
    end
  end

  it 'renders classroom information on the show view' do
  # removed prefixes for compatibility
    student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
  @classroom = classroom
  render template: 'classrooms/show.html.erb'
    expect(rendered).to match /Math/
  end

  it 'renders a partial that only contains classroom (not student) information' do
  # removed prefixes for compatibility
  @classroom = classroom
  render partial: 'classrooms/classroom', locals: { classroom: @classroom }
    expect(rendered).to match /Math/
  end

  it 'renders student information for each student using the partial' do
  # removed prefixes for compatibility
  @classroom = classroom
  render template: 'classrooms/show.html.erb'
    classroom.students.each do |student|
      expect(rendered).to include(student.name)
    end
  end

  # Already covered by previous test: student info is rendered from the partial
end

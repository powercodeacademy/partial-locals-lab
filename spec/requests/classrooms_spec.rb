require 'rails_helper'

describe "Classrooms", type: :request do
  let!(:classroom) { Classroom.create(course_name: 'Math', semester: "Spring #{Time.now.year}") }
  let!(:students) do
    5.times.map do
      s = Student.create(name: Faker::Name.name, hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
      ClassroomStudent.create(student: s, classroom: classroom)
      s
    end
  end

  it "renders classroom info on the show page" do
    get classroom_path(classroom)
    expect(response.body).to include('Math')
    expect(response.body).to include(classroom.semester)
  end

  it "renders each student using the partial (by unique HTML structure)" do
    get classroom_path(classroom)
    students.each do |student|
      # The student partial renders a <ul> with Name, Birthday, Hometown
      expect(response.body).to match(/<ul>\s*<li>\s*Name: #{Regexp.escape(student.name)}/)
    end
  end
end

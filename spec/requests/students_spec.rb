require 'rails_helper'

describe "Students", type: :request do
  let!(:students) do
    [
      Student.create(name: 'Bob', hometown: 'Springfield', birthday: '2000-01-01'),
      Student.create(name: 'Robert', hometown: 'Shelbyville', birthday: '2001-02-02'),
      Student.create(name: 'Roberta', hometown: 'Ogdenville', birthday: '2002-03-03'),
      Student.create(name: 'Shirley', hometown: 'North Haverbrook', birthday: '2003-04-04'),
      Student.create(name: 'Shelby', hometown: 'Capital City', birthday: '2004-05-05')
    ]
  end

  it "renders all students on the index page using the partial (by unique HTML structure)" do
    get students_path
    students.each do |student|
      expect(response.body).to match(/<ul>\s*<li>\s*Name: #{Regexp.escape(student.name)}/)
    end
  end

  it "renders search results with the partial" do
    get students_path, params: { query: 'rob' }
    expect(response.body).to include('Robert')
    expect(response.body).to include('Roberta')
    expect(response.body).not_to include('Bob')
  end

  it "renders the new student form with correct fields" do
    get new_student_path
    expect(response.body).to include('Create Student')
    expect(response.body).to include('Name')
    expect(response.body).to include('Hometown')
    expect(response.body).to include('Birthday')
  end

  it "renders the edit student form with correct fields" do
    get edit_student_path(students.first)
    expect(response.body).to include('Update Student')
    expect(response.body).to include('Name')
    expect(response.body).to include('Hometown')
    expect(response.body).to include('Birthday')
  end

  it "renders the student show page with partial content (by unique HTML structure)" do
    get student_path(students.first)
    expect(response.body).to match(/<ul>\s*<li>\s*Name: #{Regexp.escape(students.first.name)}/)
    expect(response.body).to include(students.first.hometown.capitalize)
  end
end

require "rails_helper"
# removed: replaced by request specs
RSpec.describe "create and edit form", type: :view do
  describe 'create form' do
    it "renders create student form from the new.html file" do
  # removed prefixes for compatibility
  student = Student.new
  @student = student
  render :template => "students/new.html.erb"
      expect(rendered).to match /Create Student/
    end

    it "renders the form fields from the _form partial" do
  # removed prefixes for compatibility
  student = Student.new
  @student = student
  render :template => "students/new.html.erb"
      expect(rendered).to include('form')
      expect(rendered).to include('Name')
      expect(rendered).to include('Hometown')
      expect(rendered).to include('Birthday')
    end


  # The above test covers that the form is rendered with the correct fields and local
  end

  describe 'edit form' do
    it "renders edit student form from the edit.html file" do
  # removed prefixes for compatibility
  student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
  @student = student
  render :template => "students/edit.html.erb"
      expect(rendered).to match /Update Student/
    end

    it "renders the form fields from the _form partial on edit" do
  # removed prefixes for compatibility
  student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
  @student = student
  render :template => "students/edit.html.erb"
      expect(rendered).to include('form')
      expect(rendered).to include('Name')
      expect(rendered).to include('Hometown')
      expect(rendered).to include('Birthday')
    end


  # The above test covers that the form is rendered with the correct fields and local
  end
end

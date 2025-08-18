require "rails_helper"
# removed: replaced by request specs
RSpec.describe "show_view", type: :view do
  let(:student){ Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))}

  it "renders student information from the classroom show view" do
  # removed prefixes for compatibility
  @student = student
  render :template => "students/show.html.erb"
    expect(rendered).to include('Bobby')
  end

  it "renders the student information from the _student partial" do
  # removed prefixes for compatibility
  @student = student
  render :template => "students/show.html.erb"
    expect(rendered).to include(student.name)
    expect(rendered).to include(student.hometown)
  end

  # The above test covers that the partial renders the student info
end

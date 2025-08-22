require 'rails_helper'

RSpec.describe 'show_view' do
  before do
    lookup_context.prefixes << 'students'
  end
  let(:student) { Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago)) }

  it 'renders student information from the classroom show view' do
    assign(:student, student)
    render template: 'students/show'
    expect(rendered).to include('Bobby')
  end

  it 'renders a students/student partial' do
    assign(:student, student)
    render template: 'students/show'
    expect(rendered).to render_template(partial: 'students/_student')
      .or render_template(partial: '_student')
  end

  it 'displays the student information from the partial' do
    assign(:student, student)
    render partial: 'students/student', locals: { student: student }
    expect(rendered).to match(/Bobby/)
  end
end

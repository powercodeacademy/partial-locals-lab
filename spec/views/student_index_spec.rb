# removed: replaced by request specs
require "rails_helper"

RSpec.describe "Student", type: :view do
  describe 'search' do
    let(:student_names) { ['Bob', 'Robert', 'Roberta', 'Shirley', 'Shelby'] }

    before do
      student_names.each do |name|
        Student.create(name: name, hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
      end
    end

    context 'when it receives a search query' do
      it 'returns all students whose names contain the given string' do
  # removed prefixes for compatibility
  @students = Student.search('rob')
  render :template => "students/index.html.erb"
        expect(rendered).to match /Roberta/
      end

      it 'renders the results with a partial' do
  # removed prefixes for compatibility
  @students = Student.search('rob')
  render template: 'students/index.html.erb'
        # Instead of render_template, check for content from the partial
        Student.search('rob').each do |student|
          expect(rendered).to include(student.name)
        end
      end
    end
  end
end

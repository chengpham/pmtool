require 'rails_helper'

# Write the following tests for the PM Tool Project Model:
# Validation of the presence of the project title
# Validation of the uniqueness of the project title
# Validation that the due_date must be greater than today's date

RSpec.describe Project, type: :model do
  describe "validates" do
    describe "title" do
      it "requires a title" do
        project = FactoryBot.build(:project, title: nil)
        project.valid?
        expect(project.errors.messages).to(have_key(:title))
      end
      it 'title is unique' do
        persisted_project= FactoryBot.create(:project)
        project=FactoryBot.build(:project, title: persisted_project.title)
        project.valid?
        expect(project.errors.messages).to(have_key(:title))
      end
    end
    describe 'due_date' do  
      it 'requires due_date greater than today' do
        project=FactoryBot.build(:project, due_date: nil)
        project.valid?
        expect(project.errors.messages).to(have_key(:due_date))
      end
    end
  end
end

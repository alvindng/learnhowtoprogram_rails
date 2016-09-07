require 'rails_helper'

describe 'the add a course process' do
  it "adds a new course" do
    visit courses_path
    click_on 'Add a Course'
    fill_in "Name", :with => "Rails"
    click_on "Create Course"
    expect(page).to have_content "Rails"
  end
  it "gives error when no name is entered" do
    visit new_course_path
    click_on "Create Course"
    expect(page).to have_content 'errors'
  end
end

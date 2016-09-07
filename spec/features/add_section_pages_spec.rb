require 'rails_helper'

describe 'the add a section process' do
  it "adds a new section" do
    course = Course.create(name: "Rails")
    visit courses_path
    click_on 'Rails'
    click_on "Add a new Section"
    fill_in "Name", :with => "Week 1 Rails"
    click_on "Create Section"
    expect(page).to have_content "Week 1 Rails"
  end
  it "gives error when no name is entered" do
    course = Course.create(name: "Rails")
    visit courses_path
    click_on 'Rails'
    click_on "Add a new Section"
    click_on "Create Section"
    expect(page).to have_content 'errors'
  end
end

require 'rails_helper'

describe "Show Question Page", :js => true do

  let!(:question) { FactoryGirl.create :question }
  before(:each) do
    visit question_path(question)
  end

  it "user can delete a question" do
    click_link("Destroy")
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content("Questions")
    expect(page).to_not have_content(question.title)
  end

  it "user can edit a question" do
    click_link("Edit Question")
    fill_in "question_content", with: (question.content + "UPDATED Capybara")
    fill_in "question_title", with: (question.title + "UPDATED Capybara")
    click_button "Update Question"
    expect(page).to have_content("UPDATED Capybara")
  end

end
require 'rails_helper'

describe "New Question Page", :js => true do

  let!(:question) { FactoryGirl.attributes_for :question }
  before(:each) do
    visit new_question_path
  end

  it "user can create a question with valid params" do
    fill_in "question_title", with: question[:title]
    fill_in "question_content", with: question[:content]
    click_on "Create Question"
    expect(page).to have_content question[:title]
  end

  it "displays the correct error message when no title given" do
    fill_in "question_content", with: question[:content]
    click_on "Create Question"
    expect(page).to have_content "Title can't be blank"
    expect(page).to_not have_content "Content can't be blank"
  end

  it "displays the correct error message when no content given" do
    fill_in "question_title", with: question[:title]
    click_on "Create Question"
    expect(page).to have_content "Content can't be blank"
    expect(page).to_not have_content "Title can't be blank"
  end

  it "displays the correct error message when neither content nor title given" do
    click_on "Create Question"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Content can't be blank"
  end


end
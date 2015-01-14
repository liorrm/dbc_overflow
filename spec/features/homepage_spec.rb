require 'rails_helper'

describe "Homepage", :js => true do ## js true allows javascript
  let!(:question) { FactoryGirl.create :question }
  it "user can see a list of all questions" do
    visit root_path
    expect(page).to have_content(question.title)
  end

  it "user can click on create question link and be redirected"

  it "user can create a question" do
    question = FactoryGirl.attributes_for :question
    visit '/questions/new'
    fill_in "question_title", with: question[:title]
    fill_in "question_content", with: question[:content]
    click_on "Create Question"
    expect(page).to have_content question[:title]
  end
 end
# just implement these later, chamud. your situation is a little different from the lecture.
    #you can use id, name, or placeholder for Capybara forms. otherwise it wont find them.


# by default, let "lazy loads", which means it doesnt store into database until it is used. But this is a problem because by the time we need it we are on the page. To mitigate this, just add bang to let on line 4, which "eager loads" it.


## mass assignment in rails is when you assign all attributes at once. AR dosnt likeit, so we have to write that private method to ALLOW mass assignment.
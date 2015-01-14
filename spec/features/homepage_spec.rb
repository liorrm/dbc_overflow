require 'rails_helper'

describe "Homepage", :js => true do ## js true allows javascript
  let!(:question) { FactoryGirl.create :question }
  it "user can see a list of all questions" do
    visit root_path
    expect(page).to have_content(question.title)
  end

  it "user can click on create question link and be redirected" do
    visit root_path
    click_link('Create Question')
    expect(page).to have_content("Title Content")
  end

  context "Voting" do

    it "user can upvote a question" do
      visit root_path
      expect {
        click_button('Upvote')
      }.to change { page.first('h4').text.to_i }.by(1)

    end

    it "user can downvote a question" do
      visit root_path
      expect {
        click_button('Downvote')
      }.to change { page.first('h4').text.to_i }.by(-1)

    end

  end

 end
# just implement these later, chamud. your situation is a little different from the lecture.
    #you can use id, name, or placeholder for Capybara forms. otherwise it wont find them.


# by default, let "lazy loads", which means it doesnt store into database until it is used. But this is a problem because by the time we need it we are on the page. To mitigate this, just add bang to let on line 4, which "eager loads" it.


## mass assignment in rails is when you assign all attributes at once. AR dosnt likeit, so we have to write that private method to ALLOW mass assignment.
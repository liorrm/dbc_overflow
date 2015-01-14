require 'rails_helper'

describe "Homepage", :js => true do ## js true allows javascript
  let!(:question) { FactoryGirl.create :question }
  it "user can see a list of all questions" do
    visit root_path
    expect(page).to have_content(question.title)
  end

  it "user can create a question" do
    later = FactoryGirl.attributes_for :question
    # just implement these later, chamud. your situation is a little different from the lecture.
    #you can use id, name, or placeholder for Capybara forms. otherwise it wont find them.
  end

end


# by default, let "lazy loads", which means it doesnt store into database until it is used. But this is a problem because by the time we need it we are on the page. To mitigate this, just add bang to let on line 4, which "eager loads" it.


## mass assignment in rails is when you assign all attributes at once. AR dosnt likeit, so we have to write that private method to ALLOW mass assignment.
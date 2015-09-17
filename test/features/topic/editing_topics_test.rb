require "test_helper"

feature "Topics::EditingTopics" do
  scenario "Users can update topics." do
    sign_in(:one)
    topic = topics(:one)
    visit topic_path(topic.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Topic"
    page.must_have_content "New edit title"
  end

  scenario "visitor cannot update topics" do
    visit root_path
    page.find("tbody tr:last").click_on "Edit"
    page.must_have_content "You need to sign in or sign up before continuing."
  end
end

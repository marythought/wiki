require "test_helper"

feature "Topics::CreatingTopics" do
  scenario "user can create a new topic post" do
    sign_in(:one)
    page.text.must_include "Signed in successfully."
    visit topics_path
    click_link('New Topic')
    fill_in "Title", with: "This is a new wiki topic"
    fill_in "Body", with: "And here is some useful info about the topic."
    click_button('Create Topic')
    page.must_have_content "This is a new wiki topic"
  end

  scenario "unauthenticated site visitors cannot create new topics" do
    visit new_topic_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end
end

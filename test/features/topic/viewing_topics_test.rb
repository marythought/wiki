require "test_helper"

feature "VisitingTheWikiIndex" do
  scenario "public topic index contains wiki topic" do
    visit topics_path
    page.text.must_include "Welcome to the Hillman City Wiki"
    page.text.must_include topics(:one).title
    page.text.must_include topics(:two).title
  end

  scenario "topics display users" do
    # log in user
    visit root_path
    click_link('Log in')
    fill_in 'Email', with: users(:one).email
    fill_in 'Password', with: 'password'
    click_button('Log in')
    # make an edit to prompt association
    topic = topics(:one)
    visit topic_path(topic.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Topic"
    # check that page reflects user as contributor
    page.text.must_include users(:one).name
  end
end

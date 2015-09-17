require "test_helper"

feature "Topics::EditingTopics" do
  scenario "As an author, I want to update articles so that I can fix typos." do
    sign_in(:author)
    article = articles(:one)
    visit article_path(article.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Topic"
    page.must_have_content "New edit title"
    page.wont_have_content articles(:published).body
  end

  scenario "users can update articles" do
    sign_in(:user)
    article = articles(:one)
    visit article_path(article.id)
    click_link('Edit')
    fill_in "Title", with: "New edit title"
    fill_in "Body", with: "New body text"
    click_button "Update Topic"
    page.must_have_content "New edit title"
    page.wont_have_content articles(:published).body
  end
end

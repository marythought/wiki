require "test_helper"

feature "Articles::CreatingArticles" do
  scenario "author can create a new article post" do
    sign_in(:author)
    page.text.must_include "Signed in successfully."
    visit articles_path
    click_link('New Article')
    fill_in "Title", with: "This is a new title"
    fill_in "Body", with: "And this is a new body."
    click_button('Create Article')
    page.must_have_content "This is a new title"
    page.text.must_include "Unpublished"
  end

  scenario "editor can create a new article" do
    sign_in(:editor)
    page.text.must_include "Signed in successfully."
    visit articles_path
    click_link('New Article')
    fill_in "Title", with: "This is a new title"
    fill_in "Body", with: "And this is a new body."
    check "Published"
    click_on "Create Article"
    page.must_have_content "This is a new title"
    page.text.must_include "Status: Published"
  end

  scenario "unauthenticated site visitors cannot visit new_article_path" do
    visit new_article_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new article button" do
    visit articles_path
    page.wont_have_link "New Article"
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_article_path
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_article_path
    page.must_have_field('article[published]')
    fill_in "Title", with: articles(:unpublished).title
    fill_in "Body", with: articles(:unpublished).body
    check "Published"
    click_on "Create Article"
    page.text.must_include "Status: Published"
  end
end

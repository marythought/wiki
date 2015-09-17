require "test_helper"

feature "Articles::DeletingArticles" do
  scenario "editor can delete a article" do
    sign_in(:editor)
    Article.create(title: "Becoming a Fode Cellow", body: "Means striving.")
    number_of_articles = Article.all.count
    visit articles_path
    page.find("tbody tr:last").click_on "Destroy"
    page.wont_have_content "Fode Cellow"
    assert_equal Article.all.count, number_of_articles - 1
  end

  scenario "authors cannot delete an article" do
    sign_in(:author)
    visit articles_path
    page.wont_have_content "Destroy"
  end

  scenario "users cannot delete an article" do
    visit articles_path
    page.wont_have_content "Destroy"
  end
end

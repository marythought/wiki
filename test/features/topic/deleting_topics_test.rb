require "test_helper"

feature "Topics::DeletingTopics" do
  scenario "user can delete a topic" do
    sign_in(:one)
    Topic.create(title: "Delete Me!", body: "Don't worry I'll be back.")
    number_of_topics = Topic.all.count
    visit root_path
    page.find("tbody tr:last").click_on "Destroy"
    page.wont_have_content "Delete Me!"
    assert_equal Topic.all.count, number_of_topics - 1
  end

  scenario "visitor cannot delete an topic" do
    visit root_path
    page.find("tbody tr:last").click_on "Destroy"
    page.must_have_content "You need to sign in or sign up before continuing."
  end
end

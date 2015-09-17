require "test_helper"

feature "VisitingTheWikiIndex" do
  scenario "public topic index contains wiki topic" do
    visit topics_path
    page.text.must_include "Welcome to the Hillman City Wiki"
    page.text.must_include topics(:one).title
    page.text.must_include topics(:two).title
  end

  scenario "topics display users" do
    topic = topics(:one)
    visit topic_path(topic.id)
    # page.text.must_include users(:cassie).name
  end
end

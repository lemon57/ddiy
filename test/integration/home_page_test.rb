require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Book local professionals for repair and renovations"
  end
end

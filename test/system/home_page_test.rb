require "application_system_test_case"

class HomePageTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Book local professionals for repair and renovations"
  end
end

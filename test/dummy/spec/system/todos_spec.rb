require 'rails_helper'

RSpec.describe "Todos", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "creating a Todo" do
    visit "/todos"
    click_on "New Todo"

    fill_in "Title", with: "Todo Title"
    click_on "Create Todo"

    expect(page).to have_text "Todo successfully created"
  end

  it "with retry", retry: 2 do
    visit "/todos"
    click_on "New Todo"

    fill_in "Title", with: "Todo Title"
    click_on "Create Todo"

    expect(page).to have_text "Todo successfully created"
  end

  it "without test recorder", test_recorder: false do
    visit "/todos"
    click_on "New Todo"

    fill_in "Title", with: "Todo Title"
    click_on "Create Todo"

    expect(page).to have_text "Todo successfully created"
  end
end

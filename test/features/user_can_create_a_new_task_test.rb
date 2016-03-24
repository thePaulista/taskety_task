require "../test_helper"

class UserCanCreateANewTaskTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_a_new_test
    visit '/'

    click_link("New Task")
    fill_in("task[title]", with  "Fun Task")
    fill_in("task[description
  end
end

require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_manager.create({
      :title       => "a title",
      :description => "a description"
    })

    task = task_manager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_can_create_a_list_of_tasks
    create_tasks(3)

    assert_equal 3, task_manager.all.count
  end

  def test_it_can_find_an_i
    create_tasks(3)

    task = task_manager.find(2)
    assert_equal Task, task.class
    assert_equal "a title 2", task.title
    assert_equal "a description 2", task.description
  end

  def test_it_can_delete_a_task
    create_tasks(3)

    all_tasks = task_manager.all

    assert_equal 3, task_manager.all.count
    assert all_tasks.any? { |task| task.title == "a title 3" }

    task_manager.delete(3)
    assert_equal 2, task_manager.all.count

    #refute all_tasks.any? { |task| task.title == "a title 3" }
  end

  def test_it_can_update_a_title
    create_tasks(1)
    updated_params = {
      title: "updated title",
      description: "updated description"
    }

    task = task_manager.find(1)
    assert_equal "a title 1", task.title

    task_manager.update(1, updated_params)
    task = task_manager.find(1)
    assert_equal "updated title", task.title
  end

end

require "test_helper"

class TaskTest < ActiveSupport::TestCase
  
  test "newly created tasks are uncomplete by default" do
      task = tasks(:one)
      assert_same(task.completed, false)
  end
  
  test "tasks can be completed" do
      task = tasks(:two)
      assert_same(task.completed, true)
  end
  
  test "should not save without title" do
    task = tasks(:three)
    assert_not task.save
  end
  
  
end

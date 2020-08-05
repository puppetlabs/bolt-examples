#!/usr/bin/env ruby

installdir_path = "../../ruby_task_helper/files/task_helper.rb"
local_path = "../files/task_helper.rb"

# Task is being run with bolt and helper is at location relative to task
if File.exist?(installdir_path)
	require_relative installdir_path
# TODO MODULES-8605 reccomend efficient pattern for testing locally
else
	require_relative local_path
end

class MyTask < TaskHelper
  def task(name: nil, **kwargs)
    { greeting: "Hi, my name is #{name}" }
  end
end

if __FILE__ == $0
  MyTask.run
end

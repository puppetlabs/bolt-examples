# @summary
#   Attempt to install python on targets, then run a task using python if it
#   installed successfully and falling back to bash or powershell.
#   This plan demonstrates editing targets during a plan run, as well as simple
#   plan constructs like iterating over an array and conditionals.
#
# @param targets
#  The targets to run on.
# @param task
#  The task to run after attempting python install
#
# @return ResultSet The result of running the task
#
# @example Run task 'examples::mytask'
#   run_plan(examples::dynamic_inventory, $targets, 'task' => 'examples::mytask')
#
plan examples::dynamic_inventory (
  TargetSpec $targets,
  String $task,
) {
  # Install python
  $result = run_task('package', $targets,
                     'name' => 'python',
                     'action' => 'install',
                     '_catch_errors' => true)

  # Let users know which targets failed python install
  # This is an example of a conditional
  unless $result.ok {
      out::message("Installing python failed on #{$result.error_set.targets}")
  }

  # Set the python feature on all targets that successfully had python
  # installed, allowing the task to use the python version instead of shell.
  # This is an example of iterating over an array
  $result.ok_set.targets.each |$target| {
      set_feature($target, 'python', true)
  }

  # Run a task on all targets. Targets with the python interpreter will use the
  # python version, while targets where install failed will use either the bash
  # or powershell version.
  # Return the output of the task
  return run_task($task, $targets)

}


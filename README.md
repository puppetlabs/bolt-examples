# Bolt Example Library

This repo contains a variety of examples demonstrating common patterns used when writing Bolt plans
and tasks. To see what plans and tasks are available, run:

```
bolt plan show
```
or 
```
bolt task show
```

## The Examples

### Tasks

* **examples::python_task_helper** and **examples::ruby_task_helper**: These tasks simply print a
  message with the provided name.

  * Using the ruby and python task helpers
  * Returning structured output

### Plans

* **examples::remove_apache**: This is a short YAML plan that stops the Apache service on RHEL
  targets using the service task, a command, and the package task. It demonstrates:

  * A YAML plan running tasks and commands
* **examples::dynamic_inventory**: This Puppet plan attempts to install python on the provided
  targets, then adds the 'python' feature to the targets that succeeded and runs a task that has
  python, bash, and powershell implementations. This demonstrates:

  * Catching and handling errors
  * Printing messages for the user
  * Iterating over an array
  * Modifying targets during a plan run

# Make sure the ruby_task_helper module is in the same directory as your bolt
# project. For example:
# $ ls modules/
# ruby_task_helper/
# myproject/

require_relative '../../tasks/ruby_task_helper.rb'
# An example of testing a task using the helper

describe 'MyTask' do
  let(:params) { { name: "Robert'); DROP TABLE Students;--" } }
  let(:task) { MyTask.new() }

  it 'runs my task' do
    expect(task.task(params)).to eq({greeting: "Robert'); DROP TABLE Students;--"})
  end
end

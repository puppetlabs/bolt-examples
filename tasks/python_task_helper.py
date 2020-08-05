#!/usr/bin/env python

import os, sys
import pathlib
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python_task_helper', 'files'))
from task_helper import TaskHelper

class MyTask(TaskHelper):
    def task(self, args):
        return {'result': 'Hi, my name is '+args['name']}

if __name__ == '__main__':
    MyTask().run()


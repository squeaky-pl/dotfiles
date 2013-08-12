#!/usr/bin/env python

from os import execvp
from subprocess import check_call, check_output, CalledProcessError
from sys import argv


program = argv[1]

try:
    windows = check_output(['xdotool', 'search', '--class', program])
except CalledProcessError as e:
    if e.returncode != 1:
        raise

    execvp(program, argv[1:])
else:
    window = windows.splitlines()[-1]
    check_call(['xdotool', 'windowactivate', window])

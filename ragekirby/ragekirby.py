#!/usr/bin/env python
# coding: utf-8

import sys
import time

sleepTime = int(sys.argv[1])

switch = 0;
while (True):
  if (switch == 0):
    print("(╮°_°)╮ ┳━┳    ...     ")
    switch = 1;
  else:
    print("(╯°□°)╯ ┻━┻ !!!!!!!!!!!!")
    switch = 0;

  time.sleep(sleepTime)

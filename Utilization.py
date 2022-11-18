# -*- coding: utf-8 -*-
"""
Created on Tue Nov 15 16:36:25 2022

@author: John Frederick LÆRUM
"""
import numpy as np

Period_Sense = 150
Period_Act = 20
Period_Think = 10

Comput_Sense = 85.906982
Comput_Act = 0.274658
Comput_Think = 0.091553

NoOfTasks = 3

UtilBound = NoOfTasks*(2**(1/NoOfTasks) - 1)

UtilTest = (Comput_Sense / Period_Sense) + (Comput_Act / Period_Act) + (Comput_Think / Period_Think)

if (UtilTest < UtilBound):
  print("The Utilization test concludes with:",UtilTest, ". Which is less than ", UtilBound, "TEST PASSED")
else:
  print("The Utilization test concludes with:",UtilTest, ". Which is greater than ", UtilBound, "TEST FAILED")



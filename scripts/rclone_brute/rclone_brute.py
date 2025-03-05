import os
import sys
import signal
import subprocess
import time

def rclone_brute():
    with open('rockyou.txt', 'r') as file:
        for line in file:
            line = line.strip()
            print("Password Attempt: " + line)
            os.system("start cmd /k python rclone_brute_2.py " + line)
            time.sleep(.30)
            os.system("taskkill /im cmd.exe")

rclone_brute()

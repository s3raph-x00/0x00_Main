# P

import glob, os, sys, string, subprocess, shutil
os.chdir("./")
program='./porg/fix.exe'
for file in glob.glob("*cap*"):
	subprocess.call([program, file])
	#shutil.move(file, "./processed/" + file)

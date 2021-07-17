# Packet Merger

import glob, os, sys, string, datetime, time, shutil

file2 = ""
os.chdir("./")
program='start ./porg/merge.exe'
for file in glob.glob("*cap*"):
	file2 = file2 + " " + file
	print file2
timestr = time.strftime("%Y%m%d-%H%M%S")
args = program + " -w " + timestr + file2
os.system(args)

time.sleep(30)
source = './'
dest = './processed/'
movers = os.listdir("./")

#for file2bmoved in movers:
#    if file2bmoved.endswith(".cap"):
#        shutil.move(os.path.join(source, file2bmoved), dest)
newname = timestr + ".pcap"

import os
import sys
import signal

def main(arg1):
    line = arg1
    os.environ["RCLONE_CONFIG_PASS"] = line
    os.system("rclone.exe --config=rclone.conf config show")
    with open(line + ".txt", 'w') as sys.stdout:
        print(line)
      
if __name__ == "__main__":
    main(sys.argv[1])

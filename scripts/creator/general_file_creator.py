import os
import random
  
for i in range(1000):
    filename1 = random.choice(open("filenames.txt").readline().split())
    print(filename1)
    filename_ext = random.choice(open("extensions.txt").readline().split())
    filename_full = filename1 + filename_ext
    with open(filename_full, 'wb') as fout:
        fout.write(os.urandom(random.randint(102400000, 512000000)))

Yeah, programmatically it works (Maybe). Realistically, lol...
<br>
This was created as a one-shot to try a brute an encrypted Rclone conf.
<br>
<br>
Notes:
<br>
The rclone.conf is the encrypted rclone configuration file. Modify as needed. <br>
Also you need to specify the specific password file (right now it is RockYou.txt which is not included).<br>
The thought would be to have the script write the successful password to the file.<br>

_______________________|----- Successful Attempt ----- > Write to file named after password <br>
Password Attempt ----| <br>
_______________________|------- Failed Attempt ------> Prompt for User Input --------> Process killed after 30 seconds <br>
<br>
There are far better ways to do this, I was tied after 3 days of threat hunting after finding the rclone file. This was my terrible solution.

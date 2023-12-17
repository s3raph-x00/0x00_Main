@ setlocal enableextensions 
@ cd /d "%~dp0"

for /R %%a in (*.exe) do (

netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=out program="%%a" action=block
netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=in program="%%a" action=block
)

@echo off
for /f "tokens=5" %%a in ('netstat -aon ^| findstr %1 ^| findstr LISTENING') do taskkill /pid %%a /f && echo killed PID %%a
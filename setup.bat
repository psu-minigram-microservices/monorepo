@echo off
cd /d "%~dp0"

echo Initializing submodules...
git submodule update --init --recursive

echo Creating services directory...
if not exist "services" mkdir services

call :link "auth-service"    "sources\auth-service"
call :link "chats-service"   "sources\chats-service"
call :link "frontend-service" "sources\frontend-service"
call :link "profile-service" "sources\profiles-service\backend\Minigram\Minigram.Profile"

echo Done!
exit /b 0

:link
set "name=%~1"
set "target=%~2"

if exist "services\%name%" (
    echo   [skip] services\%name% already exists
    exit /b 0
)

if not exist "%target%" (
    echo   [warn] target %target% does not exist, skipping %name%
    exit /b 0
)

mklink /J "services\%name%" "%target%"
echo   [ok] services\%name% -^> %target%
exit /b 0
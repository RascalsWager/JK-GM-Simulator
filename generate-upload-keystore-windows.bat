@echo off
setlocal
echo This creates an Android upload keystore for Google Play.
echo Keep the .jks file and passwords safe. Do not upload the .jks file directly to GitHub.
echo.

set /p STOREPASS=Enter keystore password:
set /p KEYPASS=Enter key password:
set KEYALIAS=jkgmsim
set KEYSTORE=jkgmsim-upload-key.jks

keytool -genkeypair ^
  -v ^
  -keystore %KEYSTORE% ^
  -alias %KEYALIAS% ^
  -keyalg RSA ^
  -keysize 2048 ^
  -validity 10000 ^
  -storepass %STOREPASS% ^
  -keypass %KEYPASS% ^
  -dname "CN=Jester King GM Simulator, OU=Jester King, O=Jester King, L=Austin, S=Texas, C=US"

echo.
echo Created %KEYSTORE%
echo.
echo Now convert it to base64 for GitHub Secrets:
certutil -encode %KEYSTORE% keystore_base64.txt
echo.
echo Open keystore_base64.txt, remove the BEGIN/END lines, and paste the remaining text into GitHub Secret:
echo ANDROID_KEYSTORE_BASE64
echo.
echo Also add these GitHub Secrets:
echo KEYSTORE_PASSWORD = the keystore password you entered
echo KEY_ALIAS = %KEYALIAS%
echo KEY_PASSWORD = the key password you entered
pause

$ErrorActionPreference = "Stop"
Write-Host "=== Campus Helpdesk compiler ===" -ForegroundColor Cyan

$tomcat = "C:\tomcat\apache-tomcat-10.1.60"
if (!(Test-Path "$tomcat\lib\servlet-api.jar")) {
    Write-Host "Tomcat not found at $tomcat" -ForegroundColor Red
    Write-Host "Edit the `$tomcat line in compile.ps1 to your Tomcat folder."
    exit 1
}

$jar = Get-ChildItem ".\WEB-INF\lib\*.jar" | Select-Object -First 1
if ($null -eq $jar) {
    Write-Host "MySQL Connector/J .jar is missing from WEB-INF\lib" -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Force ".\WEB-INF\classes" | Out-Null
$files = Get-ChildItem ".\src" -Recurse -Filter "*.java" | ForEach-Object FullName
javac -cp "$tomcat\lib\servlet-api.jar;$($jar.FullName)" -d ".\WEB-INF\classes" $files

Write-Host "Compilation successful!" -ForegroundColor Green
Write-Host "Now copy this folder to $tomcat\webapps\CampusHelpdesk and start Tomcat."

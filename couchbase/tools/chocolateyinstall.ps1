  #In order perform an unattended installation the setup.iss file must be in the same directory as the installer
  
  $chocTempDir = Join-Path $env:TEMP "chocolatey"
  $tempDir = Join-Path $chocTempDir "couchbase"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
  $setupConfig = Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) "..\content\setup.iss"
  Copy-Item $setupConfig $tempDir
  
  Install-ChocolateyPackage 'couchbase' 'EXE' '/s' 'http://packages.couchbase.com/releases/1.8.0/couchbase-server-enterprise_x86_1.8.0.setup.exe' 'http://packages.couchbase.com/releases/1.8.0/couchbase-server-enterprise_x86_64_1.8.0.setup.exe'  -validExitCodes @(0)
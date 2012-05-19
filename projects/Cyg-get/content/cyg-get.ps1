param(
	[string]$package
)

if($package -eq "default") {
	& cygwininstaller -q -R c:\Cygwin -l c:\Cygwin\packages -s ftp://mirrors.kernel.org/sourceware/cygwin
} elseif ($package -eq "" -or $package -eq $null) {
	write-output "specify a package name or 'default' to install all of the base packages"
} else {
	& cygwininstaller -q -R c:\Cygwin -l c:\Cygwin\packages -s ftp://mirrors.kernel.org/sourceware/cygwin -P $package
}
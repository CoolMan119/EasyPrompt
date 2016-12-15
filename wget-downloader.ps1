echo Downloading wget...
$A = Invoke-WebRequest -URI https://dl.dropbox.com/s/z4az82a8dugphuw/wget.exe
$B = Invoke-WebRequest -URI https://dl.dropbox.com/s/10amx88vigtydmf/libssl32.dll
$C = Invoke-WebRequest -URI https://dl.dropbox.com/s/p9qjp7mhxay0244/libintl3.dll
$D = Invoke-WebRequest -URI https://dl.dropbox.com/s/nv7le57mjyoqm4m/libiconv2.dll
$E = Invoke-WebRequest -URI https://dl.dropbox.com/s/vodhls2hfn3dybs/libeay32.dll
echo Installing wget...
$file1 = 'wget.exe'
$file2 = 'libssl32.dll'
$file3 = 'libintl3.dll'
$file4 = 'libiconv2.dll'
$file5 = 'libeay32.dll'
$path = pwd
New-Item -path $path -Name $file1 -Value A.Content -ItemType file -force
New-Item -path $path -Name $file2 -Value B.Content -ItemType file -force
New-Item -path $path -Name $file3 -Value C.Content -ItemType file -force
New-Item -path $path -Name $file4 -Value D.Content -ItemType file -force
New-Item -path $path -Name $file5 -Value E.Content -ItemType file -force
echo Done!
start $path\finish.bat

# Setup
$source = "./libs/macos"
$dest = "./Sources/TrinsicServices"
Get-ChildItem $source -Recurse | `
    Where-Object { $_.PSIsContainer -eq $False -and $_.Extension -eq ".a" } | `
    ForEach-Object {Copy-Item -Path $_.Fullname -Destination $dest -Force} # Do the things
Copy-Item -Path "$source/../C_header/okapi.h" -Destination "$dest/include" -Force

swift build
swift test
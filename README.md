# apg
Astronix Package Manager, a pkgmgr for my LFS system which can be usable on any distro

# tree
/usr/bin/apg.sh (pkgmgr executable, you can put apg.sh on any folder you want which in your PATH.)
|
|-- repo (folder). the folder which includes the packages' source tarballs. you can mix everything you want in here, like        |   entireity of blfs, slfs and glfs etc, or other sources. set $APG_REPO_PREFIX to repo folder's filesystem path.
|
|-- apg (folder). the folder includes building (build.txt) and installing (install.txt) files. set $APG_PREFIX to apg folder's   |   fs path. you need to copy & paste building and installing commands to desired files.

# state
this mgr is currently under a basic state which means the program is usable.

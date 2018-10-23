### How to build and deploy new version
- update the version number in the control file
- run the `make package FINALPACKAGE=1` command. this will generate a new deb file in the packages folder.
- copy the new deb file over to the `deb` folder in the repo project.
- run the `update.sh` script in the root of the repo project. this will update the Packages manifest files.
- check in latest files in the repo project to auto-deploy to cydia.kemmis.info
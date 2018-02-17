# Chocolatey Packages

[![Build status](https://ci.appveyor.com/api/projects/status/sohse27h798u1grs?svg=true)](https://ci.appveyor.com/project/synax/chocolatey-packages)

## Chocolatey Packages

This contains Chocolatey packages, both manually and automatically maintained.

You can choose to use one or both of the different methods currently supported in the Chocolatey community for automatic packaging. They are AU (Automatic Updater) and Ketarin/ChocolateyPackageUpdater. This repo only uses AU.

### Folder Structure

* automatic - where automatic packaging and packages are kept. These are packages that are automatically maintained using [AU](https://chocolatey.org/packages/au) 
* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* manual - where packages that are not automatic are kept.
* setup - items for prepping the system to ensure for auto packaging.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)
#### AU

* PowerShell v5+.
* The [AU module](https://chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).

### Recommendation on Auto Packaging

AU provides more in the process of being completely automated, sending emails when things go wrong, and providing a nice report at the end. It doesn't have a bolt-on feeling to it that you see with Ketarin / ChocolateyPackageUdater, however the one thing it does lack in comparison is no visual feedback to seeing how searches for installers may be found. Other than that, it provides errors when things go wrong, where Ketarin doesn't consider anything that happens during "before run"/"post run updates" (where chocopkgup and checksumming occur) to be an error, even if those scripts error.

So for best visibility, enjoying the ease of using AppVeyor, and for a nice report of results, we recommend AU over Ketarin. You also don't need to deal with templates as AU works directly with the xml/ps1 files to do replacement.
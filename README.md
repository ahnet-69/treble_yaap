<p align="center">
  <img src="https://avatars.githubusercontent.com/u/70501337?s=200&v=4">
</p>

### To get started with building YAAP GSI,
You'll need to get familiar with [Git and Repo](https://source.android.com/source/using-repo.html) as well as [How to build a GSI](https://github.com/phhusson/treble_experimentations/wiki/How-to-build-a-GSI%3F).

### Create the directories
As a first step, you'll have to create and enter a folder with the appropriate name.
To do that, run these commands:

```bash
mkdir YAAP
cd YAAP
```

### To initialize your local repository, run this command:
```bash
repo init -u https://github.com/yaap/manifest.git -b thirteen
```

### Clone the Manifest to add necessary dependencies for gsi
```bash
git clone https://github.com/ahnet-69/treble_manifest.git -b yaap-13 .repo/local_manifests
```

### Afterwards, sync the source by running this command:
```bash
repo sync --force-sync --optimized-fetch --no-tags --current-branch --no-clone-bundle --prune -j$(nproc --all)
```

### After syncing, apply the patches:
Copy the patches folder to rom folder and in rom folder
```bash
patches/apply-patches.sh .
```

#### NOTE: Its recommended to apply patches manually by going to respective directory of the patches and applying them by using "git am" as the script often skips applying critical patches for unknown reasons.

## Adapting for YAAP
Clone this repository and then copy YAAP.mk to device/phh/treble in rom folder. Then run the following commands:
```bash
 cd device/phh/treble
 bash generate.sh YAAP
```

### Turn on caching to speed up build
You can speed up subsequent builds by adding these lines to your ~/.bashrc OR ~/.zshrc file:

```bash
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export CCACHE_MAXSIZE=50G # 50 GB
```

## Compilation 
In rom folder, for building Gapps

```bash
. build/envsetup.sh
ccache -M 50G -F 0
lunch treble_arm64_bgN-userdebug 
 
 # Remove TARGET_BUILD_GAPPS=true if building vanilla.
TARGET_BUILD_GAPPS=true make systemimage -j$(nproc --all)
```

## Compress
After compilation,
If you want to compress the build.
In rom folder,

```bash
cd out/target/product/tdgsi_arm64_ab
xz -9 -T0 -v -z system.img 
```

## Troubleshoot
If you face any conflicts while applying patches, apply the patch manually.


## Credits
These people have helped this project in some way or another, so they should be the ones who receive all the credit:
- [YAAP Team](https://github.com/yaap)
- [Phhusson](https://github.com/phhusson)
- [AndyYan](https://github.com/AndyCGYan)
- [Ponces](https://github.com/ponces)
- [Peter Cai](https://github.com/PeterCxy)
- [Iceows](https://github.com/Iceows)
- [ChonDoit](https://github.com/ChonDoit)
- [Nazim](https://github.com/naz664)
- [UniversalX](https://github.com/orgs/UniversalX-devs/)
- [TQMatvey](https://github.com/TQMatvey)

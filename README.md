![alt text][logo]

[logo]:https://avatars.githubusercontent.com/u/70501337?s=200&v=4 "Yet Another AOSP Project"

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
    git clone https://github.com/captaincookie200/treble_manifest.git

### Afterwards, sync the source by running this command:
```bash
   repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch
```



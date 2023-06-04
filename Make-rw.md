## Introduction
### Why Read Only?
Most devices have small system partition which might even be less than 3GB. To tackle this we enable shared blocks through which we can reduce the image's size to a huge extent. 

### What are shared blocks and why does it make it read only?
Basically imagine if you have two files that are close, for instance vndk-28/libbinder.so and vndk-29/libbinder.so, which are identical except few parts, then to save space you can share the blocks between those files. This means that on the storage, the second file doesn't take as much space. The issue however is that when you want to modify vndk-28/libbinder.so, if you do nothing, it will also modify vndk-29/libbinder.so, which is never what you want. So to protect against this, kernel will refuse any write to file systems using this feature. That's why "shared_blocks" FS can't be written to, and you need "unshared_blocks" FS to write to.

## Requirements
- A Linux pc (WSL/Debain or ubuntu based distributions/Arch based distributions etc.)
- Downloaded GSI which is read only (yaap in this case)
- Functioning brain (idk i dont have it but yes)
- Basic linux skills

## Alright lets do it
It work take long i promise (hopefully)

- Open a shell
- Make a folder. Call it whatever. I'll call it Yaap-rw
```bash
mkdir Yaap-rw # Makes the folder in the directory your console is in
cd Yaap-rw # Changes directory to the new folder
```
- Uncompress yaap from .xz file and copy it to our new folder
- Rename YAAP's file name to system.img (e.g. We rename it fro YAAP-UNOFFICIAL-xyzetc.img to system.img)
- First we resize the image to 4GB to fit our new unshared blocks. if the image is near to 4GB or higher then do 6GB etc. Dont worry we'll reduce it back later
```bash
resize2fs system.img 5G # 5G = 5GB etc.
```
- Now we finally unshare the blocks!
```bash
e2fsck -E unshare_blocks system.img
```

If it asks you to run a cmd and errors without it. and file size doesnt change then run the cmd and run the above command again.

There! the same file you copied is now read/write!

But wait theres more. We need to reduce the file size to the minimum that it can be.

- Run the following command to resize it to the minimum that it can be.
```bash
resize2fs -M system.img
```

Now enjoy your read/write rom. go flash it the image. (dirty flashing over existing installation will work)

you can even mount  the readwrite image and make modifications to it

```bash
sudo mount -o loop system.img /mnt
```

then play around with files at /mnt/

then unmount it later after ur done

```bash
sudo umount /mnt
```

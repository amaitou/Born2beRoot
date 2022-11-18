----
![VRlogo](https://user-images.githubusercontent.com/49293816/202593303-f11f8a05-204f-4484-8745-f2635b9ab054.jpg)

----
# Born2beRoot

This is the fourth project of `42/1337Cursus`. <br />
This project's goal is to help you set up your `virtual Machine` under specific instructions to get you close and close to know more about to world of virtualization.

The project consists of two parts
- **Mandatory Part**
- **Bonus Part**

> Note: The **Bonus Part** is not that necessary to validate the project, but it gives some extra XPs and spreads **`The Blackhole`**.

----

# What is LVM?

![LVM Cropped](https://user-images.githubusercontent.com/49293816/202592106-165fba90-e47f-4ff1-85e7-d7777c1062df.jpg)


**LVM** stands for `Logical Volume Management/Manager`, it is a system of managing storage `Logical Volumes` (Explained below).
**LVM** helps you create flexible disks as well as gives you the ability to manage them dynamically (resizing, striping ...). <br />
**LVM** does not deal with physical disks, so in order to create your `Logical Volume` **LVM** converts the physical disks to `Physical Volumes` then collects them in groups called `Volume Groups`, then Gives them to the `Logical Volume`.

* **Physical volume** -> A `Physical Volume` is any physical storage device, such as a Hard Disk Drive (HDD), Solid State Drive (SSD), or partition, that has been initialized as a physical volume with **LVM**, The `PV` is a divided chunk of data that also known as `Physical Extents` and that last have the same size as the other `PEs` (4 MB by default).

    ---

* **Volume Group** -> The `Volume Group` is a group of `Physical Volumes` collected with each other in one place called `VG`.

    ---

* **Logical Volume** -> The `Logical Volume` is the result of the dividing of the `Volume Groups`. in other words the `Volume Groups` are linked together into the `Logical Volume` that acts as **Virtual Disk**.

    ---


    **_Conclusion of LVM_**
    - `LVM` does not deal with physical disks.
    - each Physical Volume has a number of `Physical Extents`.
    - each extent has a specific size (default `PE` size is _4 MO_).
    - A single `Physical Extent` is the smallest unit of disk space that can be individually managed by `LVM`

    <br />

    **_Example_** <br />
    We have a `Physical Disk` with the size of _500 GB_, and we want to convert it into _4_ `Physical Volumes` with the size of _125 GB_ to collect them within a `Volume Group`. <br />
    Here is how to calculate the number of `Physical Extents` (Default size is 4 MO): <br />

    - let's know first how many PEs would be within 1 GB: <br />
        `1 024 / 4 = 256` <br />
    - multiple the above result with the size of each PV in order to give us how many PEs would be within one PV: <br />
        `125 * 256 = 32 000` <br />
    - multiple the result of the above operation with 4 as we have 4 PVs: <br />
        `32 000 * 4 = 128 000` <br />

    Each `Physical Volume` would have _32 000_ `PEs` and the total `PEs` of the collected `PVs` is _128 000_.

----

# The difference between **aptitude** and **apt**?

`apt-get` and `aptitude ` are both package managers that are responsible for any kind of activities related to packages (removing, installing, searchin, updating, upgrading ...).

but the most obvious difference between them is that `aptitude` has a terminal menu interface to interact with, whereas `apt-get ` doesn't.

rather than the difference in the command line interface, we can say that both `aptitude` and `apt-get` are too similar to each other. but we cannot deny that they have some minor differences as instances:

- `apt-get` requires a specific command to remove the eligible files of a particular package whereas` aptitude` removes them automatically.
- ` aptitude ` actually performs the functions of not just ` apt-get `, but also some of its companion tools, such *as apt-cache* *and apt-mark*
- If the actions (installing, removing, updating packages) that you want to take cause conflicts, `aptitude ` can suggest several potential resolutions. ` apt-get ` will just say "I'm sorry Man, I can't allow you to do that.".
- ` aptitude` has the *why* and *why-not* commands to tell you which *manually installed*
 packages are preventing an action that you might want to take.
- Aptitude can find you the reason to install a certain package by looking in the list of installed packages and checking if any of their suggested packages have dependencies or any of their dependencies suggests that package or so on.

So, for most cases, the syntax of **Aptitude** is kept almost the same as that of `apt-get`, to make users of apt-get have less pain in migrating to Aptitude, but in addition to this, many powerful features are integrated into Aptitude that makes it the one to be chosen.

<br />

> I've been using `apt-get` but after I knew about `aptitude`, I started using it

<br />

### **Installing packages in `aptitude` and `apt-get`**
```sh
# apt-get
apt-get install <PackageName>

#aptitude
aptitude install <PackageName>
```

### **Search for packages in `aptitude` and `apt-get`**
```sh
# apt-get
apt-cache search <PackageName>

# aptitude
aptitude search <PackageName>
```

### **Remove packages in `aptitude` and `apt-get`**

When talking about uninstalling packages using apt package manager, we have the following two options :

- **remove**
- **purge**

The primary difference being **remove** and ‘purge‘ is that **remove** only gets rid of the package leaving any configuration files untouched. Whereas **purge** not only removes the package but also removes all configuration files OUTSIDE THE HOME DIRECTORY.

---
**NOTE** -> `aptitude` remove the package including its configuration files

---

```sh
# apt-get
apt-get remove <PackageName> # removes only the package and leaves its configuration files
apt-get purge <PackageName> # remove the package including its configuration files

# aptitude
aptitude remove <PackageName>
```

---

# **AppArmor** and **SELinux**

Both `AppArmor` and `SELinux` _(Security Enhanced Linux)_ are Linux Kernel Securities that are used to increase security in Linux distributions by hardening access to files and processes (`AppArmor` is the most used for this purpose).  <br />
These security systems provide tools to isolate applications from each other... and in turn isolate an attacker from the rest of the system when an application is compromised.

### **SELinux**
`SELinux` is a kernel module that can be enabled or disabled by the system admin. As access to files and network ports is limited following a security policy, a faulty program or a misconfigured daemon can’t make a huge impact on system security. <br />
In its default enforcing mode, `SELinux` will deny and log any unauthorized attempts to access any resource. This approach usually referred to as the principle of least privilege, means that explicit permission must be given to a user or program to access files, directories, sockets, and other services.

### **AppArmor**
`AppArmor` is a Linux Security Module implementation of name-based _Mandatory Access Controls (MAC)_. it confines individual programs to a set of listed files. <br>
`AppArmor` is installed and loaded by default. It uses *profiles* of an application to determine what files and permissions the application requires. Some packages will install their own profiles.

### The Difference between **AppArmor** and **SELinux**

- SELinux is the Default for Rocky Linux, AlmaLinux, CentOS, and Red Hat.
- SELinux is Designed to protect the entire operating system.
- AppArmor is the Default for OpenSUSE, Debian and Ubuntu.
- AppArmor works with file paths.
- AppArmor is less complex and easier for the average user to learn than SELinux.

---

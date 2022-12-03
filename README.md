----
![VRlogo](https://user-images.githubusercontent.com/49293816/202593303-f11f8a05-204f-4484-8745-f2635b9ab054.jpg)

----

# Table of content
- [Born2beRoot](https://github.com/amaitou/Born2beRoot#born2beroot)
- [What is LVM?](https://github.com/amaitou/Born2beRoot#what-is-lvm)
- [The difference between aptitude and apt?](https://github.com/amaitou/Born2beRoot#the-difference-between-aptitude-and-apt)
    - [Installing packages in aptitude and apt-get](https://github.com/amaitou/Born2beRoot#installing-packages-in-aptitude-and-apt-get)
    - [Search for packages in aptitude and apt-get](https://github.com/amaitou/Born2beRoot#search-for-packages-in-aptitude-and-apt-get)
    - [Remove packages in aptitude and apt-get](https://github.com/amaitou/Born2beRoot#remove-packages-in-aptitude-and-apt-get)
- [AppArmor and SELinux](https://github.com/amaitou/Born2beRoot#apparmor-and-selinux)
    - [SELinux](https://github.com/amaitou/Born2beRoot#selinux)
    - [AppArmor](https://github.com/amaitou/Born2beRoot#apparmor)
    - [The Difference between AppArmor and SELinux](https://github.com/amaitou/Born2beRoot#the-difference-between-apparmor-and-selinux)
- [What is SSH?](https://github.com/amaitou/Born2beRoot/blob/master/README.md#what-is-ssh)
  - [How Does SSH Work?](https://github.com/amaitou/Born2beRoot/blob/master/README.md#how-does-ssh-work)
  - [Syntax of establishing an SSH Connection](https://github.com/amaitou/Born2beRoot/blob/master/README.md#syntax-of-establishing-an-ssh-connection)
- [What is UFW?](https://github.com/amaitou/Born2beRoot/blob/master/README.md#what-is-ufw)
    - [Let's deal with UFW](https://github.com/amaitou/Born2beRoot/blob/master/README.md#lets-deal-with-ufw)
    - [UFW Profiles](https://github.com/amaitou/Born2beRoot/blob/master/README.md#ufw-profiles)
- [User and Group Management](https://github.com/amaitou/Born2beRoot#user-and-group-management)
  - [Users](https://github.com/amaitou/Born2beRoot#users)
  - [Groups](https://github.com/amaitou/Born2beRoot#groups)
- [Password Management](https://github.com/amaitou/Born2beRoot#password-management)
  - [Password Policies](https://github.com/amaitou/Born2beRoot#password-policies)
  - [Login Configuration](https://github.com/amaitou/Born2beRoot#login-configuration)
- [SUDO](https://github.com/amaitou/Born2beRoot#sudo)
  - [Understand SUDO](https://github.com/amaitou/Born2beRoot#understand-sudo)
  - [Configure SUDO](https://github.com/amaitou/Born2beRoot#configure-sudo)
- [Get close to crontab](https://github.com/amaitou/Born2beRoot#get-close-to-crontab)
  - [How to use crontab](https://github.com/amaitou/Born2beRoot#how-to-use-crontab)
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

# **What is SSH?**

`SSH (Secure Shell or Secure Socket Shell)` is a network protocol that provides a secure way to connect two machines remotely so they can transmit and receive data securely.
It is widely used by administrators to manage systems and applications remotely, deliver software patches as well as exeute commands and move files.
By default, an **SSH** Server listens on _TCP (Tranmission Control Protocol)_ port 22.

### **How Does SSH Work?**

The connection is established by an `SSH Client` that intends to connect to an `SSH Server`, the `SSH Client` starts the connection setup process and uses a pubic key to verify the identity of the `SSH Server`, after the setup step, the `SSH Protcol` uses strong symmetric encryption and hashing algorithms to ensure the privacy and integrity of the exchanged data between the `Client` and the `Server`.

### **Syntax of establishing an SSH Connection**

```sh
ssh <username>@<server ip or hostname> -p <port>
```

---

# What is **UFW**?

`UFW (uncomplicated firewall)` is a firewall configuration tool that helps you secure your network properly. as well as it is a much more user-friendly framework for managing Netfilter and a command-line interface for working with the firewall. On top of that, if you'd rather not deal with the command line, `UFW` has a few GUI tools that make working with the system incredibly simple.
> Note -> **UFW** comes pre-installed on **Ubuntu**

<br />

### **Let's deal with UFW**
- Check the status of the UFW

    ```sh
    sudo ufw status
    ```
    ---
- Enable UFW to be run at the startup of the system
  
    ```sh
    sudo ufw enable
    ```
    ---
- Disable UFW from being run at the startup of the System
  
    ```sh
    sudo ufw disable
    ```
    ---
- Block an IP Address

    ```sh
    sudo ufw deny from <x.x.x.x>
    ```
    ---
- Allow an IP Address

    ```sh
    sudo ufw allow from <x.x.x.x>
    ```
Allowing and blocking either **IP Address, Ports, Subnets** would be added to the UFW as rules.

- Delete UFW's rule

    ```sh
    # delete an UFW's rule
    sudo ufw delete <rule>
    #example
    sudo ufw delete allow from <x.x.x.x>
    ```

### **UFW Profiles**

Some of the applications that rely on network communications set up profiles in UFW that you can use to allow connections from the external address.


- List currently available profiles

    ```sh
        sudo ufw app list
    ```
    ---
- Enable a profile application

    ```sh
        # enable profile application
        sudo ufw allow <profile name>
        # example (enabling ssh)
        sudo ufw allow “OpenSSH”
    ```
    ---
- Disable an application profile

    In order to disable an application you must delete the created rule for it
    ```sh
        sudo ufw delete allow <profile name>
    ```

---

# **User and Group Management**

Here are some commands that might help you deal directly with managing, deleting, adding as well as updating users and groups within your Linux system.

### **Users**

A user in Linux is an entity that has a unique ID, that can manipulate files and performs several operations within the Linux OS.

- Get the user's id

    ```sh
    id <username>
    ```
    ---
- Add a user to the system

    ```sh
    useradd -m -d </home/"name of the directory"> -c <description> <username>
    ```

    **-m** -> creates a user with creating its home directory

    **-d** -> the name of the home directory

    **-c** -> the description of the creation of the user

    Here is the absolute path of the default user creation by user add **`/etc/default/useradd`**

    ---

- Delete a user from the system

    ```sh
    userdel -r <username>
    ```
    **-r** -> deletes the home directory of the deleted user
    
    ---

- Assign a password to a user
    
    ```sh
    passwd <username>
    ```

### **Groups**

There are two categories of groups, **Primary Group** is created automatically when we create a user with the same id as the created user as well as it gets added to the **Primary Group** to be the first and the only member of that group. <br /> 
The second category is the **Secondary Group** which is created manually by the user using specific commands and we can add a user to it.

- Add a group

    ```sh
    groupadd <groupname>
    ```

    ---

- Delete Group

    ```sh
    groupdel <groupname>
    ```
    ---

- Add a user to a particular group

    ```sh
    usermod -a -G <groupsname> <username>
    ```
    **-a** -> appends the user to the supplemental GROUPS

    **-G** -> new list of supplementary GROUPS

    ---

- Delete a user from a particular group

    ```sh
    gpasswd -d <username> <groupname>
    ```

----

# Password Management

### **Password Policies**

Not only in `Linux` but in every **OS**, the password policies are so important to generate and build strong passwords in order to avoid a few attacks (most of them are Brute-Force), that's why Linux comes with a library called `libpam-cracklib` that helps you create a strong password by setting up some options.

```sh
# to install the library, just type the following command!
apt-get install libpam-cracklib
```

> The config path of the Library is `/etc/pam.d/`
get in the path then the file called `common-password` and here is the following options to generate a strong password:

```
option=number
```

- **lcredit**: number of lowercase letters
- **ucredit**: number of uppercase letters
- **dcredit**: number of digits
- **maxrepeat**: number of consecutive identical characters
- **usercheck**: checks if the password has somehow the username
- **difok**: how many characters must not be included in the new password
- **check_username**: checks whether the password has the name of the name straight or reversed
- **enfore_for_root**: enforce the root user with these policies

### **Login Configuration**

The file `/etc/login.defs` helps when it comes to setting up some conditions related to resetting password (security related)

There is 3 option you might work with which are:

- PASS_MAX_DAYS -> Maximum number of days a password may be used
- PASS_MIN_DAYS -> Minimum number of days allowed between password changes
- PASS_WARN_AGE -> Number of days warning given before a password expires

rather than this, you can set these options using CLI:

```sh
# Syntax
sudo chage --mindays <number> --maxdays <number> --warndays <number> <username>
# Examaple
sudo chage --mindays 2 --maxdays 30 --warndays 7 amait-ou
```

- **--mindays or -m**
- **--maxdays or -M**
- **--warndays or -w**

----
# SUDO

### **Understand SUDO**

Whenever you try to run a command that requires root privileges you will be asked to have root permission, simply here where the role of sudo comes to give you privileges, not only with root but whenever you try to execute a command related to other users or root, you must type `sudo` so you can get privileged.

Not all users could use `sudo` only sudo's group members or those users that were given permission to use sudo within the configuration file `siduoers`.

- Add a user to `sudo` group

```sh
usermod -aG sudo <username>
```
- Give the user full `sudo` access using `sudoers` file

    first of all, run the command ```visudo```and then give it access. Here is the how:

```sh
#syntax
<username> ALL=(ALL) ALL
#example
amait-ou ALL=(ALL) ALL
```
> Note -> create a group and give it full sudo access give its members full sudo access as well

### **Configure SUDO**

going on with the same file `sudoers` that can be opened using the command `visudo` (best practice), there are some options that you can add to configure the `sudoers` file

- Limite the password authentication

```sh
Defaults passwd_tries=<number>
```

---

- Custome message to be shown when the password is written wrongly

```sh
Defaults badpass_message=" your message here"
```

---

- Enable the tty by default for security reasons

```sh
Defaults requiretty
```

---

- Archive sudo commands within a folder

```sh
Defaults log_output
Defaults log_input
Defaults iolog_dir = "path"
```
> So on with the other options (secure path...)

----

# Get close to crontab

the `crontab` is a file that helps you schedule your programs to be run at a specific time.

within the project, you will be asked to create a `(monitoring.sh)` that runs by the crontab every 10 minutes. the script will display some information related to the system.

> Note -> The bash script `monitoring.sh` is included under the same name within this repository

### How to use **crontab**

- add a crontab job to a specific user

```sh
sudo crontab -u <username> -e

# -u -> specify the username
# -e -> stands for edit the crontab job
```

With this command a config file will open for adding the crontab job, and here is the syntax to have it properly set

```sh
* * * * * command

# first  * (m)       -> minutes
# second * ()        -> hours
# third  *  (dom)    -> day of the month
# fourth *  (mon)    -> month
# fifth  *  (dow)    -> day of the week
```

---

- List user's crontab jobs

```sh
sudo crontab -l

# -l -> stands for list crontab jobs
```

# Contact Me

* [Twitter][_1]
* [Instagram][_2]

[_1]: https://twitter.com/amait0u
[_2]: https://www.instagram.com/amait0u

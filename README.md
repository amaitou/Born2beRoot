# Born2beRoot

This is the fourth project of `42/1337Cursus`. <br />
This project's goal is to help you set up your `virtual Machine` under specific instructions to get you close and close to know more about to world of virtualization.

The project consists of two parts
- **Mandatory Part**
- **Bonus Part**

> Note: The **Bonus Part** is not that necessary to validate the project, but it gives some extra XPs and spreads **`The Blackhole`**.

# What is LVM

**LVM** stands for `Logical Volume Management/Manager`, it is a system of managing storage `Logical Volumes` (Explained below).
**LVM** helps you create flexible disks as well as gives you the ability to manage them dynamically (resizing, striping ...). <br />
**LVM** does not deal with physical disks, so in order to create your `Logical Volume` **LVM** converts the physical discs to `Physical Volumes` then collects them in groups called `Volume Groups`, then Gives them to the `Logical Volume`.

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
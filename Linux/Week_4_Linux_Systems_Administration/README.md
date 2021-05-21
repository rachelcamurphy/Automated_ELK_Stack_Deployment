## Rachel Murphy

March 20, 2021


# Week 4-Homework Submission File: Linux Systems Administration


### **Step 1: Ensure/Double Check Permissions on Sensitive Files**



1. Permissions on /etc/shadow should allow only root read and write access. \

    *   Command to inspect permissions: `ls -l /etc/shadow` \

    *   Command to set permissions (if needed): `sudo chmod 600 /etc/shadow`

        

<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image1.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image1.png "image_tooltip")
 \


2. Permissions on /etc/gshadow should allow only root read and write access. \

    *   Command to inspect permissions: `ls -l /etc/gshadow` \

    *   Command to set permissions (if needed): `sudo chmod 600 /etc/gshadow`

        

<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image2.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image2.png "image_tooltip")


3. Permissions on /etc/group should allow root read and write access, and allow everyone else read access only. \

    *   Command to inspect permissions: `ls -l /etc/group` \

    *   Command to set permissions (if needed): `sudo chmod 644 /etc/group` \


<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image3.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image3.png "image_tooltip")

4. Permissions on /etc/passwd should allow root read and write access, and allow everyone else read access only. \

    *   Command to inspect permissions: `ls -l /etc/passwd` \

    *   Command to set permissions (if needed): `sudo chmod 644 /etc/passwd` \


<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image4.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image4.png "image_tooltip")



### **Step 2: Create User Accounts**



1. Add user accounts for sam, joe, amy, sara, and admin. \

    *   Command to add each user account (include all five users): 

         `sudo adduser sam `


        ```
        sudo adduser joe
        sudo adduser amy
        sudo adduser sara
        sudo adduser admin
        ```


2. Ensure that only the admin has general sudo access. \

    *   Command to add admin to the sudo group: `sudo usermod -aG sudo admin`



<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image5.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image5.png "image_tooltip")



### **Step 3: Create User Group and Collaborative Folder**



1. Add an engineers group to the system. \

    *   Command to add group: `sudo addgroup engineers`
2. Add users sam, joe, amy, and sara to the managed group. \

    *   Command to add users to engineers group (include all four users):

		`sudo usermod -aG engineers sam`


```
    sudo usermod -aG engineers joe
    sudo usermod -aG engineers amy
    sudo usermod -aG engineers sara
    sudo usermod -aG engineers admin

```



3. Create a shared folder for this group at /home/engineers. \

    *   Command to create the shared folder: `sudo mkdir /home/engineers`
4. Change ownership on the new engineers' shared folder to the engineers group. \

    *   Command to change ownership of engineer's shared folder to engineer group: 

        ```
        sudo chown :engineers engineers

        ```



### **Step 4: Lynis Auditing**



1. Command to install Lynis: `sudo apt-get install lynis -y` \

2. Command to see documentation and instructions: `man lynis` \

3. Command to run an audit: `sudo lynis audit system ` \

4. Provide a report from the Lynis output on what can be done to harden the system.

     \


<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image6.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image6.png "image_tooltip")



    

<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image7.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image7.png "image_tooltip")



    

<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image8.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image8.png "image_tooltip")



    

<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image9.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image9.png "image_tooltip")



    

<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image10.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image10.png "image_tooltip")




### **Bonus**



1. Command to install chkrootkit: `sudo apt-get install chkrootkit -y` \

2. Command to see documentation and instructions:  `sudo man chkrootkit` \

3. Command to run expert mode: `sudo chkrootkit -x` \

4. Provide a report from the chkrootkit output on what can be done to harden the system. \




<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image11.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image11.png "image_tooltip")


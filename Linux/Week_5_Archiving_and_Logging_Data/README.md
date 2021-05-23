## **Rachel Murphy**

March 29, 2021


### Week 5 Homework Submission File: Archiving and Logging Data



---



### **Step 1: Create, Extract, Compress, and Manage tar Backup Archives**



1. Command to **extract** the TarDocs.tar archive to the current directory:

```tar xvf ~/Downloads/TarDocs.tar```


2. Command to **create** the Javaless_Doc.tar archive from the TarDocs/ directory, while excluding the TarDocs/Documents/Java directory: 


    Starting in Projects directory

```tar cvf Javaless_Doc.tar --exclude='TarDocs/Documents/Java/*' TarDocs/Documents/*```


3. Command to ensure Java/ is not in the new Javaless_Docs.tar archive:

```tar tvf Javaless_Docs.tar | grep Java```

**Bonus**



*   Command to create an incremental archive called logs_backup_tar.gz with only changed files to snapshot.file for the /var/log directory

```tar --listed-incremental=snapshot.file -cvzf logs_backup.tar.gz /var/log```

**Bonus Testing Backup Script:**



<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image2.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image2.png "image_tooltip")



#### **Critical Analysis Question**



*   Why wouldn't you use the options -x and -c at the same time with tar? 

    - You wouldn’t use -x and -c at the same time because -x means to extract an archive and -c means to create an archive. 




---



### **Step 2: Create, Manage, and Automate Cron Jobs**


1. Cron job for backing up the /var/log/auth.log file:

```0 6 * * 3 tar czf /var/log/auth.log/auth_backup.tgz > /var/log/auth.log```

---


### **Step 3: Write Basic Bash Scripts**



1. Brace expansion command to create the four subdirectories:

```mkdir -p ~/backup5/{freemem,diskuse,openlist,freedisk}```

Paste your system.sh script edits below: 
```free -h >> ~/backups/freemem/free_mem.txt```
```du -h >> ~/backups/diskuse/disk_usage.txt```
```lsof >> ~/backups/openlist/open_list.txt```
```df -h >> ~/backups/freedisk/free_disk.txt```

3. Command to make the system.sh script executable: 

```chmod +x system.sh```

*   Commands to test the script and confirm its execution:

    ```sudo ./system.sh```





<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image6.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image6.png "image_tooltip")




<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image7.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image7.png "image_tooltip")


**Bonus**



<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image8.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image8.png "image_tooltip")




<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image9.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image9.png "image_tooltip")




---



### **Step 4. Manage Log File Sizes**



1. Run ```sudo nano /etc/logrotate.conf``` to edit the logrotate configuration file. 
 
 Configure a log rotation scheme that backs up authentication messages to the /var/log/auth.log. 

    *   Add your config file edits below:

    

<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image10.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image10.png "image_tooltip")





---



### **Bonus: Check for Policy and File Violations**



1. Command to verify auditd is active: `systemctl status auditd` 

2. Command to set number of retained logs and maximum log file size: `sudo nano /etc/audit/auditd.conf`

```
freq = 50
max_log_file = 35
num_logs = 7
priority_boost = 4
disp_qos = lossy
dispatcher = /sbin/auditspd
name_format = NONE 

```

4. **Command using auditd to set rules for /etc/shadow, /etc/passwd and /var/log/auth.log:**

    ```
    -w /etc/shadow -p wra -k hashpass_audit
    -w /etc/passwd -p wra -k userpass_audit
    -w /var/log/auth.log -p wra -k authlog_audit
    ```

5. Command to restart auditd: 

```sudo service auditd restart```

6. Command to list all auditd rules: 

```cat /etc/audit/audit.rules```

8. Command to produce an audit report: ```sudo auditctl -l```


9. Create a user with sudo useradd attacker and produce an audit report that lists account modifications:

```sudo useradd attacker```

10. Command to use auditd to watch /var/log/cron: 

```sudo auditctl -w /var/log/cron```

11. Command to verify auditd rules: 

```sudo auditctl -l```

### **Bonus (Research Activity): Perform Various Log Filtering Techniques**

1. Command to return journalctl messages with priorities from emergency to error: 

```journalctl -p err -b```

2. Command to check the disk usage of the system journal unit since the most recent boot: 

```journalctl --disk-usage``

3. Command to remove all archived journal files except the most recent two: 

```sudo journalctl --rotate --vacuum-time=1s```
```sudo journalctl --rotate --vacuum-files=2```

4. Command to filter all log messages with priority levels between zero and two, and save output to ```/home/sysadmin/Priority_High.txt```

```sudo journalctl -p 0..2 > /home/sysadmin/Priority_High.txt```

5. Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below: 

```
0 6 * * 3 tar czf /var/log/auth.log/auth_backup.tgz > /var/log/auth.log
0 0 * * * journalctl -p 0..2 >> /home/sysadmin/Priority_High.txt 
```
References: 

[https://stackoverflow.com/questions/984204/shell-command-to-tar-directory-excluding-certain-files-folders](https://stackoverflow.com/questions/984204/shell-command-to-tar-directory-excluding-certain-files-folders)

[https://www.howtogeek.com/275069/how-to-create-multiple-subdirectories-with-one-linux-command/](https://www.howtogeek.com/275069/how-to-create-multiple-subdirectories-with-one-linux-command/)

[https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs)

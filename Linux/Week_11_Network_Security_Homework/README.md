## **Rachel Murphy**

May 10, 2021


## **Unit 11 Submission File: Network Security Homework**


### **Part 1: Review Questions**


#### **Security Control Types**

The concept of defense in depth can be broken down into three different security control types. Identify the security control type of each set of defense tactics.



1. Walls, bollards, fences, guard dogs, cameras, and lighting are what type of security control? 
 
**_ Answer: Physical 
_**
2. Security awareness programs, BYOD policies, and ethical hiring practices are what type of security control? 
 
 **_Answer: Social/Administrative 
_**
3. Encryption, biometric fingerprint readers, firewalls, endpoint security, and intrusion detection systems are what type of security control? 
 
 **_Answer: Technical_** 



#### **Intrusion Detection and Attack indicators**



1. What's the difference between an IDS and an IPS? 
 
An Intrusion Detection System (IDS) **_ONLY _**monitors for security breaches and alerts external parties/admin. An Intrusion Prevention System monitors for security breaches **_AND _**will stop attacks / attackers.  

2. What's the difference between an Indicator of Attack and an Indicator of Compromise? 
 
An **Indicator of Attack** occurs in real time and is proactively being monitored before the attacker has fully breached the system. An **Indicator of Compromise** is a reactive approach to a system that has already been breached. IoCs are used by defenders to determine an attacker’s Techniques, Tactics, and Procedures (TTPs).  



#### **The Cyber Kill Chain**

Name each of the seven stages for the Cyber Kill chain and provide a brief example of each.



1. Stage 1: **Reconnaissance **- researching your target and gathering information about them. For example: Looking through their LinkedIn profile or Twitter feed.  

2. Stage 2: **Weaponization **- coding a virus in order to infiltrate a network.  

3. Stage 3: **Delivery **- sending the virus to the victim with a phishing email. 

4. Stage 4: **Exploitation **- the virus program code will run and exploit the victim’s vulnerabilities.  

5. Stage 5: **Installation **- the virus finds and installs a backdoor for the attacker to gain access to the network. 

6. Stage 6: **Command & Control (C2)** - the virus has successfully provided the attacker with full access to the network. 
7. Stage 7:** Actions on Objectives - ** the attacker begins stealing credit card numbers and laundering money from user accounts.  



#### **Snort Rule Analysis**

Use the Snort rule to answer the following questions:

Snort Rule #1


```
alert tcp $EXTERNAL_NET any -> $HOME_NET 5800:5820 (msg:"ET SCAN Potential VNC Scan 5800-5820"; flags:S,12; threshold: type both, track by_src, count 5, seconds 60; reference:url,doc.emergingthreats.net/2002910; classtype:attempted-recon; sid:2002910; rev:5; metadata:created_at 2010_07_30, updated_at 2010_07_30;)
```




1. Break down the Sort Rule header and explain what is happening.
    1. `alert` : the action that snort will take
    2. `tcp `: all tcp packets 
    3. `any` : all external packets 
    4. `->` : direction of traffic
    5. `5800:5820` : apply this rule to tcp ports 5800-5820
    6. `(msg: "ET SCAN Potential VNC Scan 5800-5820")` is the optional message printed with the alert 
 
 Answer: An alert will be triggered for any external traffic traveling on TCP ports 5800-5820 to the internal home network.  

2. What stage of the Cyber Kill Chain does this alert violate? 
 
 Answer: Reconnaissance  

3. What kind of attack is indicated? 
 
 Answer: Attempted Reconnaissance 


Snort Rule #2


```
alert tcp $EXTERNAL_NET $HTTP_PORTS -> $HOME_NET any (msg:"ET POLICY PE EXE or DLL Windows file download HTTP"; flow:established,to_client; flowbits:isnotset,ET.http.binary; flowbits:isnotset,ET.INFO.WindowsUpdate; file_data; content:"MZ"; within:2; byte_jump:4,58,relative,little; content:"PE|00 00|"; distance:-64; within:4; flowbits:set,ET.http.binary; metadata: former_category POLICY; reference:url,doc.emergingthreats.net/bin/view/Main/2018959; classtype:policy-violation; sid:2018959; rev:4; metadata:created_at 2014_08_19, updated_at 2017_02_01;)
```

1. Break down the Sort Rule header and explain what is happening.
    1. `alert `: the action that snort will take
    2. `tcp` : all tcp packets 
    3. `$EXTERNAL_NET` : packets from outside the LAN
    4. `$HTTP_PORTS` : monitor http port 80 source traffic
    5. `->` : direction of traffic
    6. `$HOME_NET` : internal network 
    7. `any` : apply this rule to all ports in the home network
    8. `(msg:"ET POLICY PE EXE or DLL Windows file download HTTP" ` 

2. What layer of the Defense in Depth model does this alert violate? 
 
 Answer: Policies, awareness, and procedures 

3. What kind of attack is indicated? 
 
 Answer: Policy Violation, not necessarily an attack.  


Snort Rule #3



*   Your turn! Write a Snort rule that alerts when traffic is detected inbound on port 4444 to the local network on any port. Be sure to include the msg in the Rule Option. 

 ```
 alert tcp $EXTERNAL_NET 4444 -> $HOME_NET any (msg: "ET Trojan. Metasploit may be listening!")
```

### **Part 2: "Drop Zone" Lab**


#### **Log into the Azure firewalld machine**

Log in using the following credentials:


*   Username: sysadmin
*   Password: cybersecurity


#### **Uninstall ufw**

Before getting started, you should verify that you do not have any instances of ufw running. This will avoid conflicts with your firewalld service. This also ensures that firewalld will be your default firewall.



*   Run the command that removes any running instance of ufw. 

 `sudo apt remove ufw`

#### **Enable and start firewalld**

By default, these services should be running. If not, then run the following commands:

Run the commands that enable and start firewalld upon boots and reboots. 

`sudo systemctl enable firewalld`

Note: This will ensure that firewalld remains active after each reboot. 


#### **Confirm that the service is running.**


*   Run the command that checks whether or not the firewalld service is up and running.

`sudo firewall-cmd --state `


#### **List all firewall rules currently configured.**

Next, lists all currently configured firewall rules. This will give you a good idea of what's currently configured and save you time in the long run by not doing double work.


*   Run the command that lists all currently configured firewall rules: 

`sudo firewall-cmd --list-all`


*   The following zones are configured (zone -services)
    *   block-none
    *   dmz-ssh
    *   drop-none
    *   external-ssh
    *   home-ssh , mdns, samba-client, dhcpv6-client
    *   Internal-ssh , mdns, samba-client, dhcpv6-client
    *   public (active)-ssh, dhcpv6-client
    *   trusted-none
    *   Work-ssh dhcpv6-client 



#### **List all supported service types that can be enabled.**



*   Run the command that lists all currently supported services to see if the service you need is available 

`sudo firewall-cmd --get-services`

*   We can see that the Home and Drop Zones are created by default. 

#### **Zone Views**

*   Run the command that lists all currently configured zones. 

 `sudo firewall-cmd --zone=work --list-all-zones`

*   We can see that the Public and Drop Zones are created by default. Therefore, we will need to create Zones for Web, Sales, and Mail.


#### **Create Zones for Web, Sales and Mail.**

Run the commands that creates Web, Sales and Mail zones. 


<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image1.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image1.png "image_tooltip")


Reload firewall



<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image2.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image2.png "image_tooltip")



#### **Set the zones to their designated interfaces:**

Run the commands that sets your eth interfaces to your zones.

 
`sudo firewall-cmd --zone=public --change-interface=eth0`
`sudo firewall-cmd --zone=web --change-interface=eth1`
`sudo firewall-cmd --zone=sales --change-interface=eth2`
`sudo firewall-cmd --zone=mail --change-interface=eth3`


<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image3.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image3.png "image_tooltip")
 



#### **Add services to the active zones:**



*   Run the commands that add services to the **public** zone, the **web** zone, the **sales** zone, and the **mail** zone. 


Public: 
 
`sudo firewall-cmd --permanent --zone=public --add-service=http`

`sudo firewall-cmd --permanent --zone=public --add-service=https`

`sudo firewall-cmd --permanent --zone=public --add-service=pop3`

`sudo firewall-cmd --permanent --zone=public --add-service=smtp`


<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image4.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image4.png "image_tooltip")




*   Web: 
 
`sudo firewall-cmd --zone=web --add-service=http`


<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image5.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image5.png "image_tooltip")

*   Sales 
 
 `sudo firewall-cmd --permanent --zone=sales --add-service=https`

    

<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image6.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image6.png "image_tooltip")


Mail 
 
 `sudo firewall-cmd --permanent --zone=mail --add-service=smtp`

 `sudo firewall-cmd --permanent --zone=mail --add-service=pop3`



<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image7.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image7.png "image_tooltip")




*   What is the status of http, https, smtp and pop3? 



#### **Add your adversaries to the Drop Zone.**

Run the command that will add all current and any future blacklisted IPs to the Drop Zone. 
 

<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image8.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image8.png "image_tooltip")
 

#### **Make rules permanent then reload them:**

It's good practice to ensure that your firewalld installation remains nailed up and retains its services across reboots. This ensures that the network remains secured after unplanned outages such as power failures.


*   Run the command that reloads the firewalld configurations and writes it to memory 
 

<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image9.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image9.png "image_tooltip")
 



#### **View active Zones**

Now, we'll want to provide truncated listings of all currently **active** zones. This is a good time to verify your zone settings.



*   Run the command that displays all zone services. 
 


<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image10.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image10.png "image_tooltip")
 



#### **Block an IP address**


*   Use a rich-rule that blocks the IP address 138.138.0.3.

    

<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image11.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image11.png "image_tooltip")


#### **Block Ping/ICMP Requests**

Harden your network against ping scans by blocking icmp echo replies.



*   Run the command that blocks pings and icmp requests in your public zone. 


<p id="gdcalert12" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image12.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert13">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image12.png "image_tooltip")
 

#### **Rule Check**

Now that you've set up your brand new firewalld installation, it's time to verify that all of the settings have taken effect.

Run the command that lists all of the rule settings. Do one command at a time for each zone.

**_PUBLIC Zone 
 
_**

<p id="gdcalert13" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image13.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert14">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image13.png "image_tooltip")



    

<p id="gdcalert14" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image14.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert15">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image14.png "image_tooltip")



    

<p id="gdcalert15" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image15.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert16">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image15.png "image_tooltip")



    

<p id="gdcalert16" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image16.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert17">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image16.png "image_tooltip")



    

<p id="gdcalert17" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image17.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert18">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image17.png "image_tooltip")




*   Are all of our rules in place? If not, then go back and make the necessary modifications before checking again. 


Congratulations! You have successfully configured and deployed a fully comprehensive firewalld installation.



---



### **Part 3: IDS, IPS, DiD and Firewalls**

Now, we will work on another lab. Before you start, complete the following review questions.


#### **IDS vs. IPS Systems**



1. Name and define two ways an IDS connects to a network. 
 
 **_Answer 1: Network Tap (Test Access Port) - inbound and outbound network traffic flows on separate channels and arrive at the monitoring device in real time. _** 
 
**_ Answer 2: SPAN (Switched Port Analyzer) or port mirroring - sends a mirror image of all network packets to another physical port to be analyzed.  
_**
2. Describe how an IPS connects to a network. 
 
**_An IPS is placed inline with the flow of data and can be placed between the firewall and network switch. _** 

3. What type of IDS compares patterns of traffic to predefined signatures and is unable to detect Zero-Day attacks? 
 
**_Signature-based attack_** 

4. Which type of IDS is beneficial for detecting all suspicious traffic that deviates from the well-known baseline and is excellent at detecting when an attacker probes or sweeps a network?  
 
**_Anomaly-based attack_** 



#### **Defense in Depth **



1. For each of the following scenarios, provide the layer of Defense in Depth that applies: 

    1. A criminal hacker tailgates an employee through an exterior door into a secured facility, explaining that they forgot their badge at home. 
 
**_Physical_** 

    2. A zero-day goes undetected by antivirus software.

        **_Application_** 


    3. A criminal successfully gains access to HR’s database. 
 
**_Data_** 

    4. A criminal hacker exploits a vulnerability within an operating system. 
 
**_Host/Endpoint Security _** 

    5. A hacktivist organization successfully performs a DDoS attack, taking down a government website. 
 
**_Network Security _** 

    6. Data is classified at the wrong classification level. 
 
**_Policy, procedures, and awareness 
_**
    7. A state sponsored hacker group successfully firewalked an organization to produce a list of active services on an email server. 


**_             Public facing servers are at the perimeter of the network_**


2. Name one method of protecting data-at-rest from being readable on hard drive. 
 
 **_Answer: Full disk encryption.  
_**
3. Name one method to protect data-in-transit. 
 
 **_Answer: Virtual Private Network Tunnel (VPN) _**
4. What technology could provide law enforcement with the ability to track and recover a stolen laptop. 
 
 **_Answer: Tracker 
_**
5. How could you prevent an attacker from booting a stolen laptop using an external hard drive? 
 
 **_Answer: Hard disk encryption_** 



#### **Firewall Architectures and Methodologies**


1. Which type of firewall verifies the three-way TCP handshake? TCP handshake checks are designed to ensure that session packets are from legitimate sources.

**_Circuit-Level Gateway Firewall_**



1. Which type of firewall considers the connection as a whole? Meaning, instead of looking at only individual packets, these firewalls look at whole streams of packets at one time.

**_Stateful firewalls_**



1. Which type of firewall intercepts all traffic prior to being forwarded to its final destination. In a sense, these firewalls act on behalf of the recipient by ensuring the traffic is safe prior to forwarding it?

**_Proxy firewalls_**

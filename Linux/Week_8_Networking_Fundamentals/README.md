## **Rachel Murphy**

April 19, 2021


# Networking Fundamentals Homework: Rocking your Network!


## Phase 1: _"I'd like to Teach the World to Ping"_

Steps & Commands:

Extracted Hollywood IP Addresses from excel file provided.


<table>
  <tr>
   <td><strong>IP Address</strong>
   </td>
   <td><strong>Hollywood Servers</strong>
   </td>
   <td><strong>Host (Up/Down)</strong>
   </td>
  </tr>
  <tr>
   <td>15.199.95.91/28
   </td>
   <td>Hollywood Database Servers
   </td>
   <td>Down
   </td>
  </tr>
  <tr>
   <td>15.199.94.91/28
   </td>
   <td>Hollywood Web Servers
   </td>
   <td>Down
   </td>
  </tr>
  <tr>
   <td>11.199.158.91/28
   </td>
   <td>Hollywood Web Servers
   </td>
   <td>Down
   </td>
  </tr>
  <tr>
   <td>167.172.144.11/32
   </td>
   <td>Hollywood Application Servers
   </td>
   <td>Up
   </td>
  </tr>
  <tr>
   <td>11.199.141.91/28
   </td>
   <td>Hollywood Application Servers
   </td>
   <td>Down
   </td>
  </tr>
</table>


Ran fping -g against all IPs to determine which hosts were responding.



<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image1.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image1.png "image_tooltip")




<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image2.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image2.png "image_tooltip")




<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image3.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image3.png "image_tooltip")




<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image4.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image4.png "image_tooltip")




<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image5.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image5.png "image_tooltip")



### **Summary**: 


## Phase 1



*   Determined IP ranges to scan were 15.199.95.91, 15.199.95.94.91, 11.199.158.91, 167.172.144.11, and 11.199.141.91. 
    *   Used the following commands to run fping: \

        *   fping -g 15.199.95.91/28
        *   fping -g 15.199.94.91/28
        *   fping -g 11.199.158.91/28
        *   fping -g 167.172.144.11/32
        *   fping -g 11.199.141.91/28
*   Determined a potential vulnerability that IP 167.172.144.11 is responding to ping requests. \

    *   Since RockStar Corp doesn't want to respond to any requests, this is a vulnerability.
*   Recommended mitigation strategy is to restrict allowing ICMP echo requests against IP 167.172.144.11 to prevent successful responses from PING requests. \

*   This occurred on the network layer as Ping uses IP addresses and IPs are used on the network layer (Layer 3). 


## **Phase 2**: _"Some Syn for Nothin`"_



<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image6.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image6.png "image_tooltip")



### **Summary**: 



*   Used the following command to SYN SCAN the vulnerable IP address 
    *    `sudo nmap -sS 167.172.144.11`
*   Any network vulnerabilities discovered.
    *   A vulnerability from the SYN SCAN was discovered. The SSH service on port 22 is open.
*   Findings associated with a hacker.
    *   A hacker could infiltrate the network on this port.
*   Recommended mitigation strategy
    *   It is recommended to close the port or shutdown the SSH service if not in use. 
*   Document the OSI layer where the findings were found.
    *   The open TCP port was discovered on the transport layer (layer 4) of the OSI model.


## Phase 3: _"I Feel a DNS Change Comin' On"_



<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image7.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image7.png "image_tooltip")




<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image8.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image8.png "image_tooltip")




<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image9.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image9.png "image_tooltip")


<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image10.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image10.png "image_tooltip")



### Summary: 



*   Used the following commands to determine why employees cannot access rollingstone.com. 
    *    `ssh jimi@167.172.144.11 `
    *    `cd/etc  `
    *    `nano hosts `
    *   `nslookup 98.137.246.8`
*   Any network vulnerabilities discovered.
    *   **DNS cache poisoning **
    *   IP address 98.137.246.8 is being used for rollingstone.com
*   Findings associated with a hacker.
    *   A hacker is redirecting traffic from the rollingstone.com IP address 151.101.128.69 to an unknown.yahoo.com IP address 98.137.246.8
*   Recommended mitigation strategy
    *   It is recommended to use Public Key Infrastructure (PKI) on the server to ensure that digital certificates will be used to authenticate your ssh sessions. Additionally, you could implement file monitoring on /etc/hosts to identify any changes. 
*   Document the OSI layer where the findings were found.
    *   This DNS attack occurs at the **application layer (layer 7)** of the OSI model. 

An instance of DNS cache poisoning found on the Hollywood server. A fake IP address was configured in the /etc/hosts file, which is redirecting traffic to unknown.yahoo.com _instead _of to rollingstone.com. This attack occurs at the application layer (layer 7) of the OSI model. 


## Phase 4: _"ShARP Dressed Man"_

Steps & Commands:

Locate secretlogs.pcapng file:


```
ssh jimi@167.172.144.11
```



```
cd etc
```



```
cat packetcaptureinfo.txt
```


**Visited this website and downloaded the secretlogs.pcap file. **



<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image11.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image11.png "image_tooltip")




<p id="gdcalert12" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image12.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert13">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image12.png "image_tooltip")



#### Import the secretlogs.pcapng file into Wireshark



<p id="gdcalert13" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image13.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert14">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image13.png "image_tooltip")


Utilized the arp filter to discover a possible ARP spoofing attack and utilized the http.request.method == “POST” filter and discovered a suspicious message. 


### Summary (ARP):


### The filter used in Wireshark after importing the packetcaptureinfo.txt file was _arp_. A potential vulnerability: address resolution protocol (ARP) spoofing was found. 

After locating and analyzing the suspicious pcap file on wireshark, a duplicate IP address was found after filtering through the ARP packets. Duplicate IP addresses can be a vulnerability known as address resolution protocol (ARP) spoofing. 

The duplicate IP is 192.168.47.200. The Hollywood server is utilizing this IP with the following MAC address (00:0c:29:1d:b3:b1). A hacker is utilizing this IP with a different MAC address (00:0c:29:0f:71:a3). 



*   Security risk of ARP spoofing is that an attacker can intercept messages and gain access to confidential information. 
*   **Mitigation strategies for ARP poisoning attack**
    *   Create static ARP entries 
    *   Implement ARP spoofing detection software
*   **ARP Spoofing occurs at the Data Link Layer (Layer 2). **

**Screenshot of Wireshark:** 



<p id="gdcalert14" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image14.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert15">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image14.png "image_tooltip")



### Summary (HTTP):



<p id="gdcalert15" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image15.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert16">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image15.png "image_tooltip")


After filtering for http.request.method == “POST” on Wireshark, the following source IP 10.0.2.15 and Destination IP 104.18.126.89 were corresponding using forms.yola.com.

A suspicious message was sent to the following location: 

[http://www.gottheblues.yolasite.com/contact-us.php](http://www.gottheblues.yolasite.com/contact-us.php) on Thursday, August 2019 at 13:01:47 GMT. 

The contact details of the hacker from the form:

Name: Mr. Hacker

Email: [Hacker@rockstarcorp.com](mailto:Hacker@rockstarcorp.com)

Message: Hi Got The Blues Corp! This is a hacker that works at Rock Star Corp. Rock Star has left port 22, SSH open if you want to hack in. For 1 million dollars I will provide you the user and password!



<p id="gdcalert16" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image16.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert17">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image16.png "image_tooltip")




<p id="gdcalert17" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image17.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert18">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image17.png "image_tooltip")




*   Recommended mitigation strategy
    *   Restrict permissions to the ssh configuration files
    *   Conduct SSH audits and monitor SSH audit logs for suspicious activity
    *   Fire Mr. Hacker, change usernames and passwords for the ssh
*   Document the OSI layer where the findings were found.
    *   This HTTP vulnerability occurs at the **application layer (layer 7)** of the OSI model. 

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


Ran `fping -g` against all IPs to determine which hosts were responding.

:![image](https://user-images.githubusercontent.com/76081641/119249478-6f168980-bb5e-11eb-992a-9c9ac83a8c0a.png):

![image](https://user-images.githubusercontent.com/76081641/119249497-966d5680-bb5e-11eb-8a77-91185069f2ac.png)

![image](https://user-images.githubusercontent.com/76081641/119249510-b735ac00-bb5e-11eb-8817-b713a8bc4c5a.png)

![image](https://user-images.githubusercontent.com/76081641/119249531-d46a7a80-bb5e-11eb-9d56-103769dec1a9.png)

![image](https://user-images.githubusercontent.com/76081641/119249542-e51af080-bb5e-11eb-8ccb-2f5255b52076.png)

### **Summary**: 


## Phase 1



*   Determined IP ranges to scan were 15.199.95.91, 15.199.95.94.91, 11.199.158.91, 167.172.144.11, and 11.199.141.91. 
    *   Used the following commands to run fping:

          ```fping -g 15.199.95.91/28```
          ```fping -g 15.199.94.91/28```
          ```fping -g 11.199.158.91/28```
          ```fping -g 167.172.144.11/32```
          ```fping -g 11.199.141.91/28```
          
*   Determined a potential vulnerability that IP 167.172.144.11 is responding to ping requests. 

    *   Since RockStar Corp doesn't want to respond to any requests, this is a vulnerability.
*   Recommended mitigation strategy is to restrict allowing ICMP echo requests against IP 167.172.144.11 to prevent successful responses from PING requests. 

*   This occurred on the network layer as Ping uses IP addresses and IPs are used on the network layer (Layer 3). 


## **Phase 2**: _"Some Syn for Nothin`"_

![image](https://user-images.githubusercontent.com/76081641/119249571-34f9b780-bb5f-11eb-9232-d69e4701e2f9.png)

### **Summary**: 


*   Used the following command to SYN SCAN the vulnerable IP address 
    *    `sudo nmap -sS 167.172.144.11`
*   Any network vulnerabilities discovered.
    *   A vulnerability from the SYN SCAN was discovered. The SSH service on port 22 is open.
*   Findings associated with a hacker.
    *   An attacker could infiltrate the network on this port.
*   Recommended mitigation strategy
    *   It is recommended to close the port or shutdown the SSH service if not in use. 
*   Document the OSI layer where the findings were found.
    *   The open TCP port was discovered on the transport layer (layer 4) of the OSI model.


## Phase 3: _"I Feel a DNS Change Comin' On"_


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

```ssh jimi@167.172.144.11```

```cd etc```

```cat packetcaptureinfo.txt```

Visited this website and downloaded the secretlogs.pcap file. 

# Import the secretlogs.pcapng file into Wireshark


Utilized the arp filter to discover a possible ARP spoofing attack and utilized the http.request.method == “POST” filter and discovered a suspicious message. 


## Summary (ARP):

The filter used in Wireshark after importing the packetcaptureinfo.txt file was _arp_. A potential vulnerability: address resolution protocol (ARP) spoofing was found. 

After locating and analyzing the suspicious pcap file on wireshark, a duplicate IP address was found after filtering through the ARP packets. Duplicate IP addresses can be a vulnerability known as address resolution protocol (ARP) spoofing. 

The duplicate IP is 192.168.47.200. The Hollywood server is utilizing this IP with the following MAC address (00:0c:29:1d:b3:b1). A hacker is utilizing this IP with a different MAC address (00:0c:29:0f:71:a3). 



*   Security risk of ARP spoofing is that an attacker can intercept messages and gain access to confidential information. 
*   **Mitigation strategies for ARP poisoning attack**
    *   Create static ARP entries 
    *   Implement ARP spoofing detection software
*   **ARP Spoofing occurs at the Data Link Layer (Layer 2). **

**Screenshot of Wireshark:** 

![image](https://user-images.githubusercontent.com/76081641/119249674-12b46980-bb60-11eb-8702-355e16c8c8e2.png)

## Summary (HTTP):

After filtering for http.request.method == “POST” on Wireshark, the following source IP 10.0.2.15 and Destination IP 104.18.126.89 were corresponding using forms.yola.com.

A suspicious message was sent to the following location: 

[http://www.gottheblues.yolasite.com/contact-us.php](http://www.gottheblues.yolasite.com/contact-us.php) on Thursday, August 2019 at 13:01:47 GMT. 

The contact details of the hacker from the form:

Name: Mr. Hacker

Email: [Hacker@rockstarcorp.com](mailto:Hacker@rockstarcorp.com)

Message: Hi Got The Blues Corp! This is a hacker that works at Rock Star Corp. Rock Star has left port 22, SSH open if you want to hack in. For 1 million dollars I will provide you the user and password!

![image](https://user-images.githubusercontent.com/76081641/119249717-62933080-bb60-11eb-8462-bf6dba42909a.png)

*   Recommended mitigation strategy
    *   Restrict permissions to the ssh configuration files
    *   Conduct SSH audits and monitor SSH audit logs for suspicious activity
    *   Fire Mr. Hacker, change usernames and passwords for the ssh
*   Document the OSI layer where the findings were found.
    *   This HTTP vulnerability occurs at the **application layer (layer 7)** of the OSI model. 

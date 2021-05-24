## <sup>✨</sup>R<sub>✨</sub>a<sup>✨</sup>c<sup>✨</sup>h<sup>✨</sup>e<sup>✨</sup>l<sub>🌟</sub> <sup>✨</sup>M<sup>✨</sup>u<sup>✨</sup>r<sup>✨</sup>p<sup>✨</sup>h<sub>✨</sub>y<sup>✨</sup>

April 24, 2021

Week 9

**Issue**: Due to the DoS attack, the Empire took down the Resistance's DNS and primary email servers.



*   The Resistance's network team was able to build and deploy a new DNS server and mail server.

*   The new primary mail server is `asltx.l.google.com` and the secondary should be `asltx.2.google.com`. 

*   The Resistance (starwars.com) is able to send emails but is unable to receive any. 


Your mission:



*   Determine and document the **mail servers** for starwars.com using NSLOOKUP.
    *   Used the following command to determine which mail servers are in use by starwars.com ` nslookup -type=MX starwars.com`
 
![image](https://user-images.githubusercontent.com/76081641/119240297-4669a200-bb14-11eb-8da1-a9e12a50ee84.png)

*   Explain why the Resistance isn't receiving any emails.
    *   The Resistance is not receiving any emails because the network team configured the new primary mail server as `asltx.l.google.com ` and the secondary server as `asltx.2.google.com` . In contrast, the DNS mail records do not indicate either domain, which is the reason why The Resistance is not receiving any email. 
*   Document what a corrected DNS record should be.
    *   A corrected DNS record would include the appropriate mail exchangers originally configured by the network team. The primary mail exchanger `asltx.l.google.com `will have a priority level of 1 and the secondary mail exchanger `asltx.2.google.com` will have a priority level of 5. 
    *   Corrected record:

`sysadmin@UbuntuDesktop:~$ nslookup -type=MX starwars.com
Server:		8.8.8.8
Address:	   8.8.8.8#53
Non-authoritative answer:
starwars.com	mail exchanger = 1 asltx.l.google.com.
starwars.com	mail exchanger = 5 asltx.2.google.com.`


### Mission 2

**Issue**: Now that you've addressed the mail servers, all emails are coming through. However, users are still reporting that they haven't received mail from the theforce.net alert bulletins.



*   Many of the alert bulletins are being blocked or going into spam folders. 

*   This is probably due to the fact that theforce.net changed the IP address of their mail server to 45.23.176.21 while your network was down. 

*   These alerts are critical to identify pending attacks from the Empire. 


Your mission:



*   Determine and document the SPF for theforce.net using NSLOOKUP.
    *   Utilized the following command to determine the SPF for the force.net

            ` nslookup -type=txt theforce.net`


*   Explain why the Force's emails are going to spam.
    *   The Force’s emails are going to spam because the SPF (Sender Policy Framework) DNS record does not show the IP address `45.23.176.21`. 
        *   An SPF record only accepts emails from trusted IP mail servers and will reject the rest.  

*   Document what a corrected DNS record should be.
    *   Corrected DNS record with the IP address of the mail server:
    
`theforce.net	text = "v=spf1 a mx mx:smtp.secureserver.net include:aspmx.googlemail.com ip4:104.156.250.80 ip4:45.63.15.159 ip4:45.63.4.215 ip4:45.23.176.21"`


### Mission 3

**Issue**: You have successfully resolved all email issues and the resistance can now receive alert bulletins. However, the Resistance is unable to easily read the details of alert bulletins online.



*   They are supposed to be automatically redirected from their sub page of resistance.theforce.net to theforce.net.

Your mission:



*   Document how a CNAME should look by viewing the CNAME of www.theforce.net using NSLOOKUP.
    *   Use the command `nslookup -type=all www.theforce.net`

        **_OR_**

    *   Use the command `nslookup -type=CNAME www.theforce.net`


*   Explain why the sub page of resistance.theforce.net isn't redirecting to theforce.net.
    *   The sub page of resistance.theforce.net is not a canonical name for theforce.net. A canonical name (CNAME) is like an alias for a website.  

*   Document what a corrected DNS record should be.
    *   A corrected DNS record would include the canonical name resistance.theforce.net as shown below.  

`Server:	8.8.8.8
Address:	8.8.8.8#53
Non-authoritative answer:
www.theforce.net	       canonical name = theforce.net.
resistance.theforce.net  canonical name = theforce.net`


## Mission 4

**Issue**: During the attack, it was determined that the Empire also took down the primary DNS server of princessleia.site.



*   Fortunately, the DNS server for princessleia.site is backed up and functioning. 

*   However, the Resistance was unable to access this important site during the attacks and now they need you to prevent this from happening again. 

*   The Resistance's networking team provided you with a backup DNS server of: ns2.galaxybackup.com. 


Your mission:



*   Confirm the DNS records for princessleia.site.

    Check the authoritative name server or NS record with the command


     `nslookup -type=NS princessleia.site`

*   Document how you would fix the DNS record to prevent this issue from happening again.
    *   To ensure site redundancy, implement a backup DNS name server for princessleia.site.

`Server:	8.8.8.8
Address:	8.8.8.8#53
Non-authoritative answer:
princessleia.site	nameserver = ns25.domaincontrol.com.
princessleia.site	nameserver = ns26.domaincontrol.com.
princessleia.site nameserver = ns2.galaxybackup.com`


### <sup><strong><em>⚡≡⚡≡⚡≡⚡M⚡i<sub>⚡</sub>s<sub>⚡</sub>s⚡i⚡o⚡n⚡≡<sub>⚡</sub>5⚡_**</sup>

**Issue**: The network traffic from the planet of Batuu to the planet of Jedha is very slow.



*   You have been provided a network map with a list of planets connected between Batuu and Jedha. 

*   It has been determined that the slowness is due to the Empire attacking Planet N. 


Your Mission:



*   View the Galaxy Network Map and determine the OSPF shortest path from Batuu to Jedha. 

*   Confirm your path doesn't include Planet N in its route. 

*   Document this shortest path so it can be used by the Resistance to develop a static route to improve the traffic.

    **The route from Batuu to Jedha is 23 hops, and avoids Planet N.**


    **Batuu → D → C → E → F → J → I → L → Q → T → V → Jedha**



### <sub>🦇</sub>M<sup>👻</sup>i<sup>🎃</sup>s<sup>🦇</sup>s<sup>👻</sup>i<sub>🎃</sub>o<sub>💀</sub>n<sup>🎃</sup> <sub>💀</sub>6<sub>👻</sub>

**Issue:** Due to all these attacks, the Resistance is determined to seek revenge for the damage the Empire has caused.



*   You are tasked with gathering secret information from the Dark Side network servers that can be used to launch network attacks against the Empire. \

*   You have captured some of the Dark Side's encrypted wireless internet traffic in the following pcap: Darkside.pcap. \


Your Mission:



*   Figure out the Dark Side's secret wireless key by using Aircrack-ng. 
aircrack-ng -w /usr/share/wordlists/rockyou.txt darkside.pcap 

  
`aircrack-ng -w /usr/share/wordlists/rockyou.txt darkside.pcap`



        The secret wireless key is dictionary. 


*   Use the Dark Side's key to decrypt the wireless traffic in Wireshark.

    Input this key into wireshark to decrypt the traffic.

    *   Three decrypted arp packets in Wireshark: 


    *   Host IP Addresses and MAC Addresses by looking at the decrypted ARP traffic. 

*   Document these IP and MAC Addresses, as the resistance will use these IP addresses to launch a retaliatory attack: 
    *   Three ARP packets were discovered after analyzing the decrypted darkside.pcap file in Wireshark. 
        *   Looking through all three arp packets for the Host IP addresses and MAC addresses:

*   Documentation of decrypted MAC & IP addresses:

        **Decrypted Wireless Traffic **


<table>
  <tr>
   <td>
<strong>Host IP Address</strong>
   </td>
   <td><strong>Host MAC Address </strong>
   </td>
  </tr>
  <tr>
   <td>172.16.0.101
   </td>
   <td>00:13:ce:55:98:ef
   </td>
  </tr>
  <tr>
   <td>172.16.0.1
   </td>
   <td>00:0f:66:e3:e4:01
   </td>
  </tr>
</table>


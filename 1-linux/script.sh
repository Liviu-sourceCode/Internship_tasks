    #!/bin/bash

# 1. Print the home directory
echo "Home directory: $(getent passwd | grep '^passwd:' | cut -d ':' -f 6)"

# 2. List all usernames from the passwd file
echo "Usernames:"
cut -d ':' -f 1 /etc/passwd

# 3. Count the number of users
user_count=$(wc -l < /etc/passwd)
echo "Number of users: $user_count"

# 4. Find the home directory of a specific user
read -p "Enter username: " username
home_dir=$(getent passwd "$username" | cut -d ':' -f 6)
echo "Home directory of $username: $home_dir"

# 5. List users with specific UID range
echo "Users with UID between 1000 and 1010:"
awk -F ':' '$3 >= 1000 && $3 <= 1010 {print $1}' /etc/passwd

# 6. Find users with standard shells
echo "Users with standard shells:"
grep -E '/bin/(bash|sh)$' /etc/passwd | cut -d ':' -f 1

# 7. Replace "/" character with "\" character in /etc/passwd and redirect to new file
sed 's/\//\\/g' /etc/passwd > passwd_new

# 8. Print private IP
private_ip=$(hostname -I | cut -d ' ' -f 1)
echo "Private IP: $private_ip"

# 9. Print public IP
public_ip=$(curl -s ifconfig.me)
echo "Public IP: $public_ip"

# 10. Switch to john user
su - john -c 'echo "Switched to user $(whoami)"'

# 11. Print the home directory
echo "Home directory of john: $(getent passwd john | cut -d ':' -f 6)"
                                                                                                                                                                                     1,1           Top                                                                                                       1,1           Top 
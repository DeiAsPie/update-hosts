# update-hosts
Simple script to update hosts on Linux systems for ad-blocking using OISD (Full) block-list

## Usage
Run the script as root

## Working
Replaces the current hosts file with the new one including updated OISD list

## Just in case
If you want your customized hosts entries to be retained after each update then add them (without #) here:

```
echo "# Loopback entries; do not change.
# For historical reasons, localhost precedes localhost.localdomain:
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# See hosts(5) for proper format and other examples:
# 192.168.1.10 foo.mydomain.org foo
# 192.168.1.13 bar.mydomain.org bar" >$NEW_HOSTS
```

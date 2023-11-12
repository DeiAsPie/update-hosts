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

## Why archive?
OISD starting from January 1, 2024, will be discontinuing support for HOSTS and DOMAINS syntaxes ([Discontinuing hosts/domains -syntax](https://oisd.nl/)). One can still use another blocklist provider's HOSTS file in the above scipt at [line 54](https://github.com/DeiAsPie/update-hosts/blob/7987584a537ca52604ea6413b64156752c8b032d/hosts_updater.sh#L54) and the script would continue to work as expected.

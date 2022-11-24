#!/bin/bash

# Creator: https://github.com/DeiAsPie
# Source Repo: https://github.com/DeiAsPie/update-hosts
# License: https://github.com/DeiAsPie/update-hosts/blob/main/LICENSE

function check_root() {
    if [ "$(id -u)" -ne "0" ]; then
        echo "This script must be run as root. Exiting..." 1>&2
        exit 1
    fi
}

function check_curl() {
    if ! [ -x "$(command -v curl)" ]; then
        echo "Error: curl is not installed. Please install it to run this script." >&2
        exit 1
    fi
}

check_root # Check for root
check_curl # Check for curl

# Create temporary directory
echo "Creating temporary directory..."
TEMP_DIR=$(mktemp -d)

if [[ ! "$TEMP_DIR" || ! -d "$TEMP_DIR" ]]; then
    echo "The temporary directory could not have been created. Exiting securely..."
    exit 1
fi

echo "Created temporary directory at $(pwd)"
# Moving into temp directory
cd "$TEMP_DIR"

# Create new temp hosts
NEW_HOSTS="hosts"
echo "Copying predefined hosts into new hosts file..."
echo "# Loopback entries; do not change.
# For historical reasons, localhost precedes localhost.localdomain:
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# See hosts(5) for proper format and other examples:
# 192.168.1.10 foo.mydomain.org foo
# 192.168.1.13 bar.mydomain.org bar" >$NEW_HOSTS

# Print the update time
DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "" >>$NEW_HOSTS
echo "# HOSTS last updated: $DATE" >>$NEW_HOSTS

echo "Downloading hosts from upstream into temporary hosts file..."
curl -s --fail https://hosts.oisd.nl/ >>$NEW_HOSTS
echo "Copying downloaded hosts contents into new hosts file..."
cat $NEW_HOSTS >/etc/hosts
## Everything ends here successfully:)
echo "Done :)"

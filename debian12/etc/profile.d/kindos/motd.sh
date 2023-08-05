devex_version=$(cat /etc/devex-version)
[[ -f /etc/motd ]] && sed -e "s#version#$devex_version#" /etc/motd && echo -e "\n"
echo "To install an SDK check the following commands":
echo "  sdkinit micromamba "

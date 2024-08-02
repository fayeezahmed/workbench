#!/usr/bin/bash -xe

cat <<EOF > "${HOME}/.config/systemd/user/zoom.slice"
[Slice]
AllowedCPUs=0-4
MemoryHigh=6G
EOF

cat /usr/share/applications/Zoom.desktop | sed -E 's#^(Exec=).*$#Exec=systemd-run --scope -p MemoryMax=4G -p MemoryHigh=2G -p MemorySwapMax=0 -p CPUQuota=25%% --user -- /usr/bin/zoom %U#' > "${HOME}/.local/share/applications/Zoom.desktop"

update-desktop-database ~/.local/share/applications

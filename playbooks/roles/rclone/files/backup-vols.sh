# Backup Vols
vols=$(rclone lsjson $(hostname):/container-vols | jq -r '.[] | .Name')

if [[ $vols == *'adguard'* ]]; then
  echo "backing up adguard for $(hostname) to GoogleDrive"
  rclone copy -P /container-vols/adguard/config/AdGuardHome.yaml GoogleDrive:/Backups/adguard/$(hostname)/AdGuardHome.yaml
fi

if [[ $vols == *'omada'* ]]; then
  echo "backing up omada for $(hostname) to GoogleDrive"
  rclone sync -P /container-vols/omada/backup GoogleDrive:/Backups/omada
fi
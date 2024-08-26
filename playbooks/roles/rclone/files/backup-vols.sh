# Backup Vols
vols=$(rclone lsjson $1:/container-vols | jq -r '.[] | .Name')

if [[ $vols == *'adguard'* ]]; then
  echo "backing up adguard for $1 to GoogleDrive"
  rclone copy -P /container-vols/adguard/config/AdGuardHome.yaml GoogleDrive:/Backups/adguard/AdGuardHome-$1.yml
fi

if [[ $vols == *'omada'* ]]; then
  echo "backing up omada for $1 to GoogleDrive"
  rclone sync -P /container-vols/omada/backup GoogleDrive:/Backups/omada
fi
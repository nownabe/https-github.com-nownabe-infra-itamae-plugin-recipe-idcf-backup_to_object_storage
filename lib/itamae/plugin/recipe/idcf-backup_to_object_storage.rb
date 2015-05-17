package "epel-release"

package "s3cmd"
directory "/etc/s3cmd/idcf"
template "/etc/s3cmd/idcf/backup_to_object_storage.cfg"

directory "/opt/idcf"
file "/opt/idcf/backup_to_object_storage.sh" do
  mode "0755"
end
template "/etc/cron.d/idcf-backup_to_object_storage"

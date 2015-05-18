package "epel-release"

package "s3cmd"
directory "/etc/s3cmd/idcf"
template "/etc/s3cmd/idcf/backup_to_object_storage.cfg" do
  owner "root"
  group "root"
end

directory "/opt/idcf"
remote_file "/opt/idcf/backup_to_object_storage.sh" do
  owner "root"
  group "root"
  mode "0755"
end

template "/etc/cron.d/idcf-backup_to_object_storage" do
  owner "root"
  group "root"
end

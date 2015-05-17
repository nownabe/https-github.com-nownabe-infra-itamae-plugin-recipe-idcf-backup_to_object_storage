require "spec_helper"

describe file("/etc/cron.d/idcf-backup_to_object_storage") do
  it { should be_file }
  it { should contain "1 * * * * root /bin/bash /opt/idcf/backup_to_object_storage.sh PATH1 BUCKET1 7" }
  it { should contain "1 * * * * root /bin/bash /opt/idcf/backup_to_object_storage.sh PATH2 BUCKET2 7 COMMAND" }
end

describe file("/etc/s3cmd/idcf/backup_to_object_storage.cfg") do
  it { should be_file }
  it { should contain "access_key = SPEC_ACCESS_KEY" }
  it { should contain "secret_key = SPEC_SECRET_KEY" }
  it { should contain "signature_v2 = True" }
end

describe file("/opt/idcf/backup_to_object_storage.sh") do
  it { should be_file }
end

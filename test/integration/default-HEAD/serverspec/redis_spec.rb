require 'serverspec'

# Required by serverspec
set :backend, :exec

describe process("redis-server") do
  it { should be_running }
end

describe file('/var/log/supervisor/ail-redis6382.log') do
  its(:content) { should match /RocksDB version:/ }
  its(:content) { should match /Creating manifest 1/ }
  its(:content) { should_not match /ERROR/ }
end

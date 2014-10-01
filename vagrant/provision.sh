# install puppet
sudo apt-get install puppet
sudo apt-get update
# verify latest release of puppet is installed
sudo puppet resource package puppet ensure=latest
# add cron job to run puppet apply every 30 minutes
sudo puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'

# install puppet modules
puppet module install maestrodev-wget
puppet module install puppetlabs-apt

# set modules path
sudo sed -i 'modulepath=/home/vagrant/.puppet/modules' /etc/puppet/puppet.conf
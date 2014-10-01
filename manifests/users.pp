include wget
include apt

$packages = [
    "git",
    "fluxgui",
    "unity-tweak-tool",
    "terminator",
    "ubuntu-restricted-extras",
    "libavformat-extra-53",
    "libavcodec-extra-53",
    "vlc",
    "sublime-text-installer",
    "win1.7",
    "compizconfig-settings-manager",
    "compiz-plugins",
    "nodejs"
]

$nodejs_deps = [
    "python-software-properties",
    "g++",
    "make",
]

apt::ppa { 'ppa:kilian/f.lux': }
apt::ppa { 'ppa:gnome-terminator': }
apt::ppa { 'ppa:ed10vi86/video': }
apt::ppa { 'ppa:webupd8team/sublime-text-3': }
apt::ppa { 'ppa:ubuntu-wine/ppa': }
apt::ppa { 'ppa:chris-lea/node.js':
    require => [
        Package['make'],
        Package['g++'],
        Package['python-software-properties'],
    ]
}

package {$nodejs_deps:
    ensure => "installed",
}

package {$packages:
    ensure => "installed",
    require => [
        Apt::Ppa['ppa:kilian/f.lux'],
        Apt::Ppa['ppa:gnome-terminator'],
        Apt::Ppa['ppa:ed10vi86/video'],
        Apt::Ppa['ppa:webupd8team/sublime-text-3'],
        Apt::Ppa['ppa:ubuntu-wine/ppa'],
        Apt::Ppa['ppa:chris-lea/node.js'],
    ]
}

# user {'nir0s':
#   ensure => present,
# }

# file {'/home/vagrant/puppet-test':
#   ensure => directory,
#   mode   => 0644,
#   owner  => nir0s,
# }

# file {'/home/vagrant/puppet-test/repos':
#   ensure => directory,
#   mode   => 0644,
#   owner  => nir0s,
# }

# file {'/home/vagrant/downloads':
#   ensure => directory,
#   mode   => 0644,
#   owner  => nir0s,
# }

# wget::fetch { "download vagrant":
#   source      => 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.deb',
#   destination => '/home/vagrant/downloads',
#   timeout     => 0,
#   verbose     => true,
#   require => File['/home/vagrant/downloads'],
# }


# cd ~/Downloads
# # Chrome (untested)
# sudo apt-get install libxss1
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome*.deb
# # Dropbox
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
# #config file at ${HOME}/.config/terminator/config so make sure to back it up

# wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
# source ~/.bash_profile
# nvm install 0.10
# nvm alias default 0.10
# nvm use 0.10
# cd ~/Downloads
# wget https://npmjs.org/install.sh
# chmod +x install.sh
# ./install.sh
# npm install -g log.io
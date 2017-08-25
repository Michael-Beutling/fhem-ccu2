################################################################################
#
# Vagrantfile
#
################################################################################

# Buildroot version to use
RELEASE='2016.11.1'

### Change here for more memory/cores ###
VM_MEMORY=2048
VM_CORES=2

Vagrant.configure('2') do |config|
	config.vm.box = 'ubuntu/trusty64'

	config.vm.provider :vmware_fusion do |v, override|
		v.vmx['memsize'] = VM_MEMORY
		v.vmx['numvcpus'] = VM_CORES
	end

	config.vm.provider :virtualbox do |v, override|
		v.memory = VM_MEMORY
		v.cpus = VM_CORES

		required_plugins = %w( vagrant-vbguest )
		required_plugins.each do |plugin|
		  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
		end
	end

	config.vm.provision 'shell' do |s|
		s.inline = 'echo Setting up machine name'

		config.vm.provider :vmware_fusion do |v, override|
			v.vmx['displayname'] = "FHEM-CCU2 #{RELEASE}"
		end

		config.vm.provider :virtualbox do |v, override|
			v.name = "FHEM-CCU2 #{RELEASE}"
		end
	end

	config.vm.provision 'shell', inline:
		"sudo dpkg --add-architecture i386
		sudo apt-get -q update
		sudo apt-get -q -y upgrade
		sudo apt-get -q -y install build-essential libncurses5-dev \
			git bzr cvs mercurial subversion libc6:i386 unzip \
			gcc-multilib linux-image-extra-virtual mtd-utils \
			perlbrew zip
		sudo apt-get -q -y autoremove
		sudo apt-get -q -y clean"

	config.vm.provision 'shell', privileged: false, inline:
		"echo 'Downloading and extracting buildroot #{RELEASE}'
		mkdir fhem-ccu2
		cd fhem-ccu2
		wget -q -c -O - http://buildroot.org/downloads/buildroot-#{RELEASE}.tar.gz|tar xz --strip-components=1
		make BR2_EXTERNAL=/vagrant ccu2_defconfig
		make -s"
	end

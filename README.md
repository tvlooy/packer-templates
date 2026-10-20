# packer-templates

[Packer](https://www.packer.io/) templates for [Vagrant](https://www.vagrantup.com/) base boxes.

Build with:

```
packer build openbsd-8.0-amd64.json
```

Import with:

````
vagrant box add --name tvlooy/openbsd-8.0-amd64 openbsd-8.0-amd64-virtualbox.box
```

Use with Vagrantfile:

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define :obsd80 do |obsd80_config|

      obsd80_config.vm.box = "tvlooy/openbsd-8.0-amd64"
      obsd80_config.vm.hostname = "obsd80"

      obsd80_config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.gui = true
      end

  end

end
```


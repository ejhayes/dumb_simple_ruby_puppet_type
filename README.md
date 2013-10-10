Example Puppet Custom Type
==========================

I found it rather difficult to find a dumb simple puppet module...so I put this dumb simple example together:

- http://docs.puppetlabs.com/guides/custom_types.html (newer)
- http://docs.puppetlabs.com/guides/complete_resource_example.html (newer)
- http://projects.puppetlabs.com/projects/1/wiki/Development_Practical_Types (older)
- http://projects.puppetlabs.com/projects/puppet/wiki/Development_Complete_Resource_Example (older)


Getting this sample running locally
===================================

Spin up the box:

        vagrant up
        vagrant ssh

Then (on the bob you are ssh'ed into):

  cd /etc/puppet/modules && sudo ln -s /vagrant bob

And run this dumb simple example with puppet apply (I called it bob):

        sudo puppet apply -e "bob { '/home/vagrant/TESTBOBBERS': ensure => present }" --modulepath=/etc/puppet/modules --verbose
        Notice: Compiled catalog for precise32.psm.local in environment production in 0.04 seconds
        Info: Applying configuration version '1381447945'
        Notice: /Stage[main]//Bob[/home/vagrant/TESTBOBBERS]/ensure: created
        Notice: Finished catalog run in 0.05 seconds

Where are the important files?

  - lib/type/bob.rb
  - lib/puppet/provider/bob/posix.rb

And yes, this is a totally contrived example.
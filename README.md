rsc_jenkins Cookbook
================
Configure a Jenkins master and optional slave server(s).


Requirements
------------

This cookbook has been verified to work with:

* Ubuntu 14.04



Recipes
-------

| Name                | Description                                |
|---------------------|--------------------------------------------|
| `rsc_jenkins::default`  | Installs Jenkins, required software and users.|
| `rsc_jenkins::add_slave_nodes` | Creates Jenkins slave(s). Run on Jenkins master.|
| `rsc_jenkins::_software` | Installs required Jenkins software.|
| `rsc_jenkins::_user` | Creates required Jenkins slave user.|




Inputs
------


| Name                        | Description                                                                |
|----------------------------|-----------------------------------------------------------------------------|
| `rsc_jenkins/slaves` | Comma separated list of Jenkins slave(s) to initialize.|
| `rsc_jenkins/public_key` | Public key which jenkins-slave user will use to connect to slave server(s) from master. |
| `rsc_jenkins/private_key` | Private key which jenkins-slave user will use to connec to slave server(s) from master. |




Usage
-----

* Attach the `rsc_jenkins::default` script to your ServerTemplate as a boot script. This will install Jenkins and the required user/software.
* Attach `rsc_jenkins::slave` as an Operational script. Run this on the master after all hosts have been confiugred and it will ssh to all slaves and add them to the cluster.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github


License and Authors
-------------------
RightScale Professional Services `<ps@rightscale.com>`

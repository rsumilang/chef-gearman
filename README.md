Gearman cookbook
=====================
The Gearman cookbook download and compiles the Gearman Job Server
onto your server. Definitions to help manage the process of starting
and stopping workers and daemons. PHP extension support provided
through PECL.


Scope
-----
This cookbook has only been tested with Ubuntu 12.04. Please let me
know if you tried it on a different platform with success or would
like help adding support.


Requirements
------------
* apt
* build-essential
* php


Recipes
-------
### default

By default, gearman will be compiled by source onto your machine.

### install_source

Compiles the Gearman by source onto your machine.

### install_package

Uses your system's package management tool to install gearman.

### ext_php

Installs the PECL PHP extension. PHP cookbook is required.


Usage
-----
Include `'recipe[gearman::server]'` or `'recipe[gearman::ext_php]'` in your run_list.


Attributes
----------

    default['gearman']['version'] = '1.1.5'
    default['gearman']['required_packages'] = %w{ ... }


Definitions
===========

The cookbook provides a few definitions to help manage daemons and
workers. At some point in the future these definitions may be
refactored into lightweight resources and providers as suggested by
[foodcritic rule FC015](http://acrmp.github.com/foodcritic/#FC015).


gearman\_daemon
---------------
This configures a daemon on your system by using an LSB script. The daemon command
is required in order for this to work.


### Parameters:

* `name` - The name you want to identify this daemon by. This should be unique.
* `acceptable` - Integer to specify minimum acceptable client duration (seconds). Defaults to 50.
* `output_file` - String specifying path to log to /var/log/gearman-worker.log.
* `command` - String specifying worker command to execute.
* `enabled` - Boolean to specify whether or not is automatically enabled. If set to true then LSB script will automatically run on system boot. Defaults to true.


### Examples:

Configure your system to run the gearman worker on boot:

	gearman_daemon 'myapp-gworker1' do
	  acceptable       50
	  output_file      '/var/log/gearman-worker.log'
	  command       	'php /foo/bar.php'
	end


gearman\_worker
---------------
This configures a worker on your system by using an LSB script.

### Parameters:

* `name` - The name you want to identify this worker by. This should be unique.
* `user` - String to specify which user this should be run as. Not typically needed, defaults to root.
* `retries` - Number of attemps to run the job before the job server removes it. Defaults to 5.
* `port` - Integer specifying what port number to run on. Defaults to 4730.
* `enabled` - Boolean to specify whether or not is automatically enabled. If set to true then LSB script will automatically run on system boot. Defaults to true.

TODO
----
- Refactor definitions into lightweight resources and providers one day.


Credits
-------
This cookbook is originally based off the installation procedure defined
by trieu:

	http://nguyentantrieu.info/blog/install-gearman-1-1-5-on-ubuntu/


License & Authors
-----------------
- Author:: Richard Sumilang (<me@richardsumilang.com>)
- URL:: http://github.com/rsumilang/chef-gearman

```text
Copyright:: 2014 Richard Sumilang

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

kthxbye
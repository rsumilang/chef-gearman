Gearman cookbook
=====================
The Gearman cookbook download and compiles the Gearman Job Server
onto your server.

This cookbook does its best to follow platform native idioms at all
times. This means things like logs, pid files, sockets, and service
managers work "as expected" by an administrator familiar with a given
platform.

Scope
-----
This cookbook has only been tested with Ubuntu 12.04. Please let me
know if you tried it on a different platform with success or would
like help adding support.

Requirements
------------
* apt
* build-essential

Resources
---------------------
The resources that ship in this cookbook are examples of 'singleton
resources'. This means that there can only be one instance of them
configured on a machine.

Recipes
-------
### default

This recipe downloads the source and compiles it onto your server.


Usage
-----
Include `'recipe[chef-gearman]'` or `'recipe[chef-gearman]'` in your run_list.

Attributes
----------

    default['gearman']['version'] = '1.1.5'
    

Credits
-------
This cookbook is originally based off the installation procedure defined
by trieu:

	http://nguyentantrieu.info/blog/install-gearman-1-1-5-on-ubuntu/

License & Authors
-----------------
- Author:: Richard Sumilang (<me@richardsumilang.com>)

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
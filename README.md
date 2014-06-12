Gearman cookbook
=====================
The Gearman cookbook download and compiles the Gearman Job Server
onto your server. PHP extension support is provided through PECL.


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

¯\_(ツ)_/¯ ... idk what you want.

### server

Compiles the Gearman source onto your machine.

### ext_php

Installs the PECL PHP extension. PHP cookbook is required.


Usage
-----
Include `'recipe[gearman::server]'` or `'recipe[gearman::ext_php]'` in your run_list.


Attributes
----------

    default['gearman']['version'] = '1.1.5'
    default['gearman']['required_packages'] = %w{ ... }
    

TODO
----
- Add support for other languages.
- Perhaps an option to configure installation through a package.


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
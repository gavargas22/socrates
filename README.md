![Socrates](http://git.at.utep.edu/uploads/applications-development/socrates/2cc435953d/Socrates.png)

# Welcome to the Socrates Project Page.

This site is being developed as an in house education enhancer through questions like the socratic method. The app was developed in Ruby on Rails

## Vagrant

Rubento is used as the development enviornment. Documentation can be found [here](https://github.com/awernick/rubento-box)

To start the Rubento server
```shell
# Fire up Vagrant box
vagrant up
vagrant ssh

# Start Rails server
cd /vagrant
rvmsudo rails server -b 0.0.0.0 -p 80
```
The server is accessible at
```
192.168.33.10
```

But in order to use SSO features, add this to your /etc/hosts file
```
192.168.33.10     dev.socrates.utep.edu
```
The webapp will now be available at `dev.socrates.utep.edu` with full SSO capabilities.
## Documentation

[Models](app-models)


## Copyright

Socrates was developed by Alan Wernick and Guillermo Vargas

Copyright 2015 [Academic technologies](http://at.utep.edu/). See [MIT-LICENCE](#) for details.

# CRE Reproduction Environments and Configuration
Repository to capture environment configuration and kong configuration to reproduce customer issues. 

## What makes up this repository : 

### Configuration
- Configuration examples for plugins and other Kong entities. Either with Admin API script, yaml, or deck files. 

### Environment
- Environment setup file for example docker-compose, Helm, vagrant, gojira etc. . 

### Test script(s)
- Reproduction scripts that mimic very specific customer use-cases and scenarios. Shell scripts, HTTPie/Curl commands, other 3rd party testing tools 

### The README file
- This file should describe how to set up the environment or run the reproduction steps. 

### Contributing Guidelines : 

* Add a directory if there is not an appropriate structure for your contribution. 

* Please include a detailed README with all configuration files and environment setup. Include references to any relevant cases or bug reports.

* Follow the naming conventions of the other examples in the repository, if the scripts are associated with a specific case you can prepend the case number to the file or include a mention of it in the readme. Make files names descriptive our outline each files purpose in the readme. 
** For example: 00016565-KongNodeAsUpstream.yaml

* You can assume that the user already knows how to use the general tooling documented ( Deck, httpie, docker ) 

** To be determined: 
- Version control to correspond to Kong version
- Git contribution guidelines, PRs or direct additions to 'master'  

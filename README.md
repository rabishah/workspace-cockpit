###Cockpit
####Pimping developer terminal workspace
##### by, Vicious Team
====

Workspace script to execute commands in multiple tabs

### Installing Cockpit
`bash install.sh`

### Configuring your cockpit
Edit `*~/.cockpit` the configuration file to create cockpits. The cockpit in the config
file is a array of tab name and command to execute in the tab

```
  cockpit_name=(
    "tab_name:command_0;command_1;command_n"
    "tab_name:command_0;command_1;command_n"
  )
``` 

```
  #!/bin/bash

  work=(
    "vim:cd ~/office/project;vim",
    "gulp:cd ~/office/project;gulp serve"
  )

  personal=(
    "vim:cd ~/personal/project;vim",
    "gulp:cd ~/personal/project;gulp watch",
    "server:cd ~/personal/project;supervisor app.js"
  )
```

### Load cockpit configuration
`cockpit.sh load work`

# VIPERator
A Bash script to generate Swift VIPER module files quickly. No complicated integrations, just simply use the terminal.

### Overview

Six (6) files will be generated:

```bash
<Module-Name>Contract.swift
<Module-Name>ViewController.swift
<Module-Name>ViewController.xib
<Module-Name>Interactor.swift
<Module-Name>Presenter.swift
<Module-Name>Router.swift
```

These are located in the folder next to where the script file is located.
You can delete the `.xib` file if it's not needed.

### Usage

```bash
# 1. Open Terminal.app and clone.
  git clone https://github.com/cefjoeii/VIPERator.git

# 2. Go to the directory where `viperator.sh` is located.
  cd VIPERator

# 3. Update the permissions if necessary
  sudo chmod 755 viperator.sh

# 4. Run
  ./viperator.sh
```

Once generated, you can drag the entire folder to the Xcode project.

The job is done. ✅

### Learn
To learn more about the practical implementation of VIPER for iOS Swift, read [here](https://betterprogramming.pub/how-to-implement-viper-architecture-in-your-ios-app-rest-api-and-kingfisher-f494a0891c43).
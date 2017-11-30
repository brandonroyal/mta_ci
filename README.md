# Docker MTA "CI in a Box"

Self-contained solution for CI within MTA Infrastructure for automated builds

## Usage

1) Build images

```bash
#!/bin/bash
sh build.sh
```

1) Set environment variables

```bash
export JENKINS_USERNAME=admin
export JENKINS_PASSWORD=password
```

1) Deploy stack

```bash
#!/bin/bash
sh deploy.sh
```

## Project Structure

```folders
project
│
└───bootstrap
│   │   ...
│
└───configs
│   │   ...
│   └───automation
│       │   ...
│   └───git
│       │   ...
│
└───services
│   │   ...
│   └───automation
│       │   ...
│   └───git
│       │   ...
│   └───git_db
│       │   ...
```

### bootstrap

Location for templated MTA PoC project structure. Include a working Jenkinsfile for automating builds

### configs

Configuration files for services used to preset the git (Gogs) and automation (Jenkins) services

### services

Services for self contained MTA CI

## Credits

[Jenkins setup automation](https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/) - Viktor Farcic (Docker Captain)

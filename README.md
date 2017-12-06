# Docker MTA "CI in a Box"

Self-contained solution for CI within MTA Infrastructure for automated builds

## Installation

1. Set environment variables

```bash
export HOSTNAME=<hostname>
```

2. Download and run deployment script

```bash
wget <gist URL .tar.gz>
```

```bash
sh deploy.sh
```

3. Browse to gogs app at `http://<hostname>:3000` and complete database configuration, using database password from previous step

![image](https://user-images.githubusercontent.com/2762697/33511810-ada5d210-d6f0-11e7-9e59-39049b1fa7aa.png)

4. Register with your own username, email and password then login

![image](https://user-images.githubusercontent.com/2762697/33511832-4e68f858-d6f1-11e7-8175-94d528778c54.png)

5. Create organization named `mta`

![image](https://user-images.githubusercontent.com/2762697/33511850-a637afc0-d6f1-11e7-9326-7d7316c4dd10.png)

6. Create new `Migration` using the following configurations:

    * **Clone Address:** `https://gitub.com/brandonroyal/mta_projecttemplate-linux`
    * **Owner:** `mta`
    * **Repository Name:** `app1`

![image](https://user-images.githubusercontent.com/2762697/33615595-89877180-d9a8-11e7-8863-4fd7e9e3b50d.png)

7. Add Jenkins webhook by navigating to `app1 >> Settings >> Webhooks` and clicking `Add Webhook >> Gogs`

![image](https://user-images.githubusercontent.com/2762697/33623991-de6247b2-d9c0-11e7-95b6-e11e5275f20b.png)

8. Include the following information in your webhook. `Save` when complete.

    * **Payload URL:** `http://automation:8080/gogs-webhook/?job=mta`
    * **Content Type:** `application/json`

![image](https://user-images.githubusercontent.com/2762697/33624198-8886dbfe-d9c1-11e7-855a-9c9b675e8fcd.png)


## Usage




## Contributing

1) Build images

```bash
sh build.sh
```

1) Set environment variables

```bash
export JENKINS_USERNAME=admin
export JENKINS_PASSWORD=password
```

1) Deploy stack

```bash
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

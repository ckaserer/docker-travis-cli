[![](https://img.shields.io/travis/com/ckaserer/docker-travis-cli/master?style=flat-square)](https://travis-ci.com/ckaserer/docker-travis-cli)
![Docker Pulls](https://img.shields.io/docker/pulls/ckaserer/travis-cli?color=brightgreen&style=flat-square)
![gplv3](https://img.shields.io/badge/license-GPL%20v3.0-brightgreen.svg?style=flat-square)
![Maintenance](https://img.shields.io/maintenance/yes/2020?style=flat-square)
<br>
<br>

# docker-travis-cli

[travis-ci.com](https://travis-ci.com) describes itself as "The simplest way to test and deploy your projects."

Travis offers a cli to interact with their services. That's great! We can use it to script functionality instead of manually executing and clicking in the UI every god damn time.

I am no fan of installing various packages with different package managers all over my workstation. I am a big fan of container technology however and use travis-ci for most of my projects on github.

Since I am an outspoken advocate of container technology and use travis-ci for most of my projects on github I put travis' cli in a ruby based container. This container is available in two flavors, either with a fixed version or with the latest and greatest travis cli release. The source code is available on [github.com/ckaserer/docker-travis-cli](https://github.com/ckaserer/docker-travis-cli)

If you need to read up on what travis cli can do for you, here is the link you seek
* [https://github.com/travis-ci/travis.rb](https://github.com/travis-ci/travis.rb)


### Preflight

Okay, the whole point is to avoid installing travis cli on our workstations. To avoid local installation we will use container technology as our abstraction layer.

Therefore we will need to install a container runtime. Please install `docker` on your workstation if you haven't done so already.

In order to make it easier to use travis as a container a few bash functions are available in the `bashrc` of the git [repository](https://github.com/ckaserer/docker-travis-cli). I really recommend that you source the [bashrc](https://raw.githubusercontent.com/ckaserer/docker-travis-cli/master/bashrc) - it abstracts away all the options and parameter used in the docker command for you. In the next section you will see why.

```
source bashrc
```

However it is not just black magic - all commands that are available via the bashrc in this repository will be printed before execution to increase transparency.

---

### Run your travis cli command in a container

Just like you would run your travis cli command locally you can do so with the `bashrc` function `docker-travis`. e.g. to get the cli version of the `travis-cli` image you are using simply run

```
docker-travis travis version
```

which wraps following command for ease of use

```
docker run --rm -it -e TZ=Europe/Vienna -v /home/myuser/.travis:/root/.travis -v /home/myuser/path/to/your/current/directory:/root ckaserer/travis-cli travis version
```

As you can see the container you are using is deleted after it ran with `--rm`, set the timezone to Europe/Vienna, mount your current directory into the container to inject updates into files in your git repository. e.g. you want to add a slack token to your `.travis.yml`. 

<!--
## Scripted usage scenarios shipped with image

### Add Slack Token

```
docker-travis-add-slack-token "workspace:myTokenString"
```

More information will be added in the future

---

### Add Docker Credentials

```
docker-travis-add-container-registry-credentials dockerUsername
```

More information can be found here

* [https://github.com/ckaserer/docker-template](https://github.com/ckaserer/docker-template)

---

### Add Google Chat Webhook URL

```
docker-travis-add-googlechat-webhook "url"
```

More information can be found here

* [https://github.com/ckaserer/bash-script-collection](https://github.com/ckaserer/bash-script-collection)
-->

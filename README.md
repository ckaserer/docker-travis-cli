[![Build Status](https://travis-ci.com/ckaserer/docker-travis-cli.svg?branch=master)](https://travis-ci.com/ckaserer/docker-travis-cli)
![Docker Pulls](https://img.shields.io/docker/pulls/ckaserer/travis-cli)
![GitHub](https://img.shields.io/github/license/ckaserer/docker-travis-cli)
![Maintenance](https://img.shields.io/maintenance/yes/2020)
<br>
<br>

# docker-travis-cli

Ruby based container with latest travis cli release. 

Travis cli documentation can be found here

* https://github.com/travis-ci/travis.rb

## Scripted usage scenarios shipped with image

### Preflight

* install docker on your workstation
* if you have Bash available you can soure the bashrc in the repo for ease of use

```
source bashrc
```

---

### Add Slack Token

```
add-slack-token "workspace:myTokenString"
```

More information will be added in the future

---

### Add Docker Credentials

```
add-docker-credentials dockerUsername
```

More information can be found here

* [https://github.com/ckaserer/docker-template](https://github.com/ckaserer/docker-template)

---

### Add Google Chat Webhook URL

```
add-googlechat-webhook "url"
```

More information can be found here

* [https://github.com/ckaserer/bash-script-collection](https://github.com/ckaserer/bash-script-collection)
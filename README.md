# quickstart-centos
Getting start in Arukas wih CentOS

## Running locally

##### Public key authentication
```
$ git clone git@github.com:peco8/quickstart-centos.git
$ cd quickstart-centos
$ docker build --no-cache --tag quickstart-centos .
$ docker run -d -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" -P quickstart-centos
```

##### username/password
If you want to use your original password instead of the default one: "root", you can
set the environment variable ROOT_PWD to your specific password when running the container:
```
$ git clone git@github.com:peco8/quickstart-centos.git
$ cd quickstart-centos
$ docker build --no-cache --tag quickstart-centos .
$ docker run -d -e ROOT_PWD="centos" -P quickstart-centos
```
And now you can ssh as root on the container’s IP address  on some port of Docker daemon's host IP address.

## Deploying to Arukas

[Install the Arukas CLI](https://github.com/arukasio/cli),

or If you have docker installed already,

##### Public key authentication
```
$ docker run --rm -e ARUKAS_JSON_API_TOKEN=<APIT_TOKEN> \
                  -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> \
                    arukasio/arukas run --instances=1 \
                                        --mem=512 \
                                        --envs AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" \
                                        --ports=22:tcp peco8/quickstart-centos

```
##### username/password
```
$ docker run --rm -e ARUKAS_JSON_API_TOKEN=<APIT_TOKEN> \
                  -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> \
                    arukasio/arukas run --instances=1 \
                                        --mem=512 \
                                        --ports=22:tcp peco8/quickstart-centos

```

## Authors

* Toshiki Inami (<t-inami@arukas.io>)

## License

This project is licensed under the terms of the MIT license.

**Continue with this tutorial [here](/).**

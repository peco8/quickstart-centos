# quickstart-centos
Getting start in Arukas wih CentOS

### LOCAL

##### Public key authentication
```
$ git clone https://github.com/peco8/quickstart-centos.git
$ cd quickstart-centos
$ docker build --no-cache .
$ docker run -d -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" -P a90b0e9160d0
$ ssh root@192.168.59.103 -p $(docker port `docker ps -q -n=1` | cut -d':' -f2)
```

##### username/password
If you want to use your original password instead of the default one: "root", you can
set the environment variable ROOT_PWD to your specific password when running the container:
```
$ git clone https://github.com/peco8/quickstart-centos.git
$ cd quickstart-centos
$ docker build --no-cache .
$ docker run -d -e ROOT_PWD="centos" -P a90b0e9160d0
$ ssh root@192.168.59.103 -p $(docker port `docker ps -q -n=1` | cut -d':' -f2)
```


## Deploying to Arukas

[Install the Arukas CLI](https://github.com/arukasio/cli),

or If you have docker installed already,

##### Public key authentication
```
$ docker run --rm -e ARUKAS_JSON_API_TOKEN=<API_TOKEN> -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" arukasio/arukas run --instances=3 --mem=512 --ports=22:tcp peco8/quickstart-centos
```
##### username/password
```
$ docker run --rm -e ARUKAS_JSON_API_TOKEN=<API_TOKEN> -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> arukasio/arukas run --instances=3 --mem=512 --ports=22:tcp peco8/quickstart-centos
```

## Author

* Toshiki Inami (<t-inami@arukas.io>)

## License

This project is licensed under the terms of the MIT license.

**Continue with this tutorial [here](/).**

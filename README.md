# ekino/chefdk

[![Circle CI](https://circleci.com/gh/ekino/docker-chefdk.svg?style=svg)](https://circleci.com/gh/ekino/docker-chefdk)

## Description

Docker image with ChefDK

## Usage

#### Basic

Start container on top of your chef repository

```bash
docker run -ti \
  -v $(readlink -f path/to/chefrepo):/data \
  ekino/chefdk
```

Then, inside the container

```bash
cd /data
knife cookbook list
knife node list
...
```

#### Advanced

In most usecases our chef repo is managed using git, and you may want to use
berkshelf and your knife.rb may require user-specific config files located in
your home directory.

So you can add relevant volume to share you host config
```bash
berksconfig="~/.berkshelf"
chefconfig="~/.chef"        # <-- folder containing user-specific configuration
gitconfig="~/.gitconfig"    # <-- this file must preexist and contain at least your git "user.email" and "user.name"
gitrepo="path/to/gitrepo"

# create required files/folders if missing, without messing up if existing
touch $gitconfig
mkdir -p $chefconfig $berksconfig

docker run --rm -ti \
  -v $(readlink -f $berksconfig):/root/.berkshelf \
  -v $(readlink -f $chefconfig):/root/.chef \
  -v $(readlink -f $gitconfig):/root/.gitconfig \
  -v $(readlink -f $gitrepo):/data \
  ekino/chefdk
```

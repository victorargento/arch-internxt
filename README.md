# arch-internxt
Run your own "mini" internxt on your local computer with Docker

## Prerequisites
Make sure you have installed Docker and Docker Compose on your development machine:
* Docker - [Download & Install Docker](https://docs.docker.com/engine/install/).
* Docker Compose - [Download & Install Docker Compose](https://docs.docker.com/engine/install/).
OSX and Windows machines can install Docker Deskop directly.

## Installation
To run this project, you have to follow some steps first

### Setup images
This script clone and build: [bridge](https://github.com/internxt/bridge), [complex](https://github.com/internxt/complex) and [core-daemon(xcore)](https://github.com/internxt/core-daemon)
```bash
bash setupImages.sh 
```

### Update images
Check if there are new commit in the projects, using this script
```bash
bash pullAndBuild.sh 
```

## Running the project
Once you have configured correctly your variables, you can run it
```bash
docker-compose up -d
```

### Stop all containers
```bash
docker-compose stop
```

### Remove all containers
```bash
docker-compose down
```

## Configuration
You can change your variables in docker-compose.yaml

### Add a renter
If you want to add a renter, you have to add a new renter service in docker-compose.yaml and change this variables

```
  renterX: # Service name
    image: renter-image
    container_name: renterX # Container name
    restart: always
    environment:
      network_private_extended_key_string: # Private key
      storjrenter_opts__networkOpts__rpcPort: # Rpc port
      storjrenter_opts__networkOpts__rpcAddress: # Your address is your service name
      storjrenter_opts__networkOpts__tunnelServerPort: # Tunnel server port
      storjrenter_opts__networkOpts__tunnelGatewayRange__min: # Tunnel gateway range min
      storjrenter_opts__networkOpts__tunnelGatewayRange__max: # Tunnel gateway range max
      storjrenter_opts__totalRenters: # Number of total renters in your network
      storjrenter_opts__renterOverlap: # Overlap renter
      storjrenter_opts__networkIndex: # Your network index
```
Change 2 variables in all renters: 
* totalRenters 
* networkIndex

Make sure that your renter config it's okay, consulting this project [Complex-offsets](https://github.com/JAlbertoGonzalez/complex-offsets)

### Add a xcore
If you want to add a xcore, change your service name, container name and your EXTERNAL_IP

```
  xcoreX: # Service name
    image: xcore-image
    container_name: # Container name 
    restart: always 
    environment:
      EXTERNAL_IP: # Your address is your service name
```

### How to generate an HD Key
Here are the detailed steps for creating an HD key for configuration:

```
// require necessary libs, get entropy, and create a key
const HDKey = require('hdkey');
const seed = require('crypto').randomBytes(64);
const hdkey = HDKey.fromMasterSeed(seed);

// to keep for other future uses
console.log(hdkey.privateExtendedKey);

// deriving the key for complex use (detailed in sip32)
const complexKey = hdkey.derive("m/3000'/0'");

// this will output expected private key used in configs
console.log(complexKey.privateExtendedKey);

// for this config value in complex
let options = {};
options.networkPrivateExtendedKey = complexKey.privateExtendedKey;

// this is the key used in contracts and contacts
console.log(complexKey.publicExtendedKey);
```

## How to interact with your containers
You can interact with them launching two commands

```
docker exec -it container-name command
```
Or
```
docker exec -it container-name /bin/sh
```
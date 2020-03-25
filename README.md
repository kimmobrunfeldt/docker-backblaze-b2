# Docker Backblaze B2 command line tool image

[![kimmobrunfeldt/backblaze-b2](http://dockeri.co/image/kimmobrunfeldt/backblaze-b2)](https://registry.hub.docker.com/u/kimmobrunfeldt/backblaze-b2/)

Docker image for the official Backblaze B2 command line tool ([Backblaze/B2_Command_Line_Tool](https://github.com/Backblaze/B2_Command_Line_Tool))

## Supported tags and respective `Dockerfile` links

-	[`1.4.2`, `latest` (*Dockerfile*)](https://github.com/andreausu/docker-backblaze-b2/blob/master/Dockerfile)

## How to use it

Authorization is done before the command you give is ran.

```
docker run --rm -v -e B2_ACCOUNT_ID=your-account-id -e B2_APPLICATION_KEY=your-application-key kimmobrunfeldt/backblaze-b2 b2 list-buckets
```

will underneath run:

```bash
b2 authorize_account your-account-id your-application-key
b2 list-buckets
```


You can see all the available commands by running:

```
docker run --rm kimmobrunfeldt/backblaze-b2 b2 --help
```


## Build and update process

This image is automatically built at every push of this repository.

# Docker Backblaze B2 command line tool image

[![kimmobrunfeldt/backblaze-b2](http://dockeri.co/image/kimmobrunfeldt/backblaze-b2)](https://registry.hub.docker.com/u/kimmobrunfeldt/backblaze-b2/)

Docker image for the official Backblaze B2 command line tool ([Backblaze/B2_Command_Line_Tool](https://github.com/Backblaze/B2_Command_Line_Tool))

## Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/andreausu/docker-backblaze-b2/blob/master/Dockerfile)

## How to use it

Authorization is done before the command you give is ran.

```
docker run --rm -v $PWD:/root -e B2_ACCOUNT_ID=$B2_ACCOUNT_ID -e B2_APPLICATION_KEY=$B2_APPLICATION_KEY kimmobrunfeldt/backblaze-b2 b2 list-buckets
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

### Using this for backups 

*Before using this method you need to take GPG into use: https://www.liquidweb.com/kb/how-do-i-use-gpg/.*

I recommend creating an encrypted file containing the environment variables, so that you can easily backup and restore files later.

Create `b2-env.sh` file with the contents:

```
export B2_ACCOUNT_ID=your-account-or-application-id
export B2_APPLICATION_KEY=your-application-key
```

Now encrypt the file with gpg: `gpg -c b2-env.sh` and remove the plain text one permanently from disk.


#### Restore file

*You can optionally backup your files by encrypting them with GPG. *

```bash
source <(gpg --decrypt b2-env.sh.gpg)

docker run --rm -v $PWD:/root -e B2_ACCOUNT_ID=$B2_ACCOUNT_ID -e B2_APPLICATION_KEY=$B2_APPLICATION_KEY kimmobrunfeldt/backblaze-b2 b2 download_file_by_name MY_BUCKET file-name-in-bucket.tar.gz ./my-file-locally.tar.gz
```

#### Backup file


```bash
source <(gpg --decrypt b2-env.sh.gpg)

docker run --rm -v $PWD:/root -e B2_ACCOUNT_ID=$B2_ACCOUNT_ID -e B2_APPLICATION_KEY=$B2_APPLICATION_KEY kimmobrunfeldt/backblaze-b2 b2 upload-file MY_BUCKET ./my-file-locally.tar.gz file-name-in-bucket.tar.gz
```


## Build and update process

This image is automatically built at every push of this repository.

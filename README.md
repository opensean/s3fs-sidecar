# s3fs

*IN DEVELOPMENT*


## example run

```
docker run --rm -it --env-file /home/slandry/.aws/s3fs-sidecar.env --privileged --cap-add SYS_ADMIN opensean/s3fs-sidecar:0.1.0
```

## env file format

```
AWS_ACCESS_KEY_ID=your-access-key-id
AWS_SECRET_ACCESS_KEY=your-secret-access-key
S3_BUCKET=bucket:prefix

## for future kms 
#SSEKMSKEYID=your-kms-master-key-id
```


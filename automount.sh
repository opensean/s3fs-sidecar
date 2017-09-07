#!/bin/bash

## Sean Landry 
## sean.d.landry@gmail.com
## https://github.com/opensean 
## mount an s3 bucket with s3fs

echo $AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY > /mnt_s0.cred 
chmod 600 /mnt_s0.cred
s3fs $S3_BUCKET $MNT_POINT -o passwd_file=/mnt_s0.cred -o allow_other -f


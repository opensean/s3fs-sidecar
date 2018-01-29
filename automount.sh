#!/bin/bash

## Sean Landry 
## sean.d.landry@gmail.com
## https://github.com/opensean 
## mount an s3 bucket with s3fs

echo $AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY > /s3fs_perm/s3fs.cred 
chmod 600 /s3fs_perm/s3fs.cred

# need to add kms options
s3fs $S3_BUCKET $MNT_POINT -o passwd_file=/s3fs_perm/s3fs.cred -o allow_root -f


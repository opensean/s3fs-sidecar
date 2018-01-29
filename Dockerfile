FROM fedora:27
LABEL maintainer "Sean Landry, sean.d.landry@gmail.com, https://github.com/opensean"

LABEL s3fs-sidecar.version="0.1.0" \
      s3fs-sidecar.description="Use s3 as backend for a kubernetes deployment by running as sidecar"

ENV S3_BUCKET ''
ENV MNT_POINT /data
ENV S3_REGION ''
ENV AWS_ACCESS_KEY_ID ''
ENV AWS_SECRET_ACCESS_KEY ''

RUN dnf install -y automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel 
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git
WORKDIR /s3fs-fuse/
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
WORKDIR /
RUN rm -rf s3fs-fuse
RUN mkdir data
RUN mkdir s3fs_perm
RUN chmod 777 s3fs_perm
RUN chmod 777 data
RUN cat /etc/fuse.conf | sed 's/# user_allow_other/user_allow_other/' > /etc/fuse_temp.conf && mv /etc/fuse_temp.conf /etc/fuse.conf
COPY automount.sh automount.sh
CMD ["./automount.sh"]

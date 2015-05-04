# phusion dump
# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.9

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

RUN apt-get update
RUN apt-get install -y python3-dev
RUN pip install virtualenv
RUN apt-get install -y libxml2-dev libxslt1-dev python-dev
RUN virtualenv --python python3 env
RUN adduser --system --group --shell /bin/bash archiveteam
RUN source env/bin/activate
RUN pip install GoogleScraper


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
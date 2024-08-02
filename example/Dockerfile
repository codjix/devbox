FROM tdim/devbox:core

# Image info
LABEL maintainer="Your Name <user@domain.tld>" \
  key="value"

# Image source necessary for build
# it must contain the entrypoint.sh file
# COPY ./path/to/source /app/custom
COPY . /app/custom

# Image pkgs
# do all things reqiures internet here
# keep layers few as match as you can
RUN apk update && \
  # install pkgs that reqiures internet at
  # post install stage of downloaded pkgs
  apk add openrc && \
  # download now, install later
  # keep target /app/pkgs to get extras only
  apk fetch -R -o /app/pkgs dnsmasq && \
  # prepare your entrypoint
  chmod 777 /app/custom/entrypoint.sh && \
  touch /app/custom/install

# make none editable directory as
# as a volume to make it writble
# not recommended
VOLUME [ "/sys/fs/cgroup" ]

# Expose main ports
EXPOSE 53

# Final setup
WORKDIR /workspace
ENTRYPOINT [ "/app/custom/entrypoint.sh" ]
CMD [ "fish" ]
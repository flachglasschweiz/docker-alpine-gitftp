# Use an official Alpine Linux as a parent image
FROM alpine:latest

# Install bash, make, curl, git
RUN apk update \
    && apk add bash \
    && apk add make \
    && apk add curl \
    && apk add git

# Create and set WORKDIR to the git-ftp installation folder
WORKDIR /opt/git-ftp/

# Clone git-ftp source code and compile the latest version
RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
    && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
    && git checkout "$tag" \
    && make install

# Set default command to Bash since git-ftp relies on it
CMD ["bash"]

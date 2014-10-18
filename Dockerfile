
#
# Node.js v0.11.14
#
# VERSION 0.0.3
#

FROM ubuntu:14.04
MAINTAINER Marcus André <hello@marcusandre.de>
ENV VERSION 0.11.14

#
# System
#

RUN apt-get update -qq
RUN apt-get install -y make gcc g++ python git libssl-dev

#
# Install node
#

RUN git clone https://github.com/joyent/node.git /usr/src/node/
RUN cd /usr/src/node && git checkout v$VERSION && ./configure && make && make install

#
# Clean up
#

RUN rm -fr /usr/src/node

#
# Entry
#

CMD ["node"]

# Usage: docker run -t -i $IMAGE

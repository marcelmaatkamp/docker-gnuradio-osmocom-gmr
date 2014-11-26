FROM marcelmaatkamp/gnuradio-libosmocore

MAINTAINER m.maatkamp@gmail.com version: 0.1

# ---
# Tetra
   
ADD AUTHORS /gnuradio/osmo-gmr/  
ADD configure.ac /gnuradio/osmo-gmr/
ADD COPYING /gnuradio/osmo-gmr/
ADD Doxyfile.in /gnuradio/osmo-gmr/
ADD git-version-gen /gnuradio/osmo-gmr/
ADD include/ /gnuradio/osmo-gmr/include/
ADD m4/ /gnuradio/osmo-gmr/
ADD Makefile.am /gnuradio/osmo-gmr/
ADD README /gnuradio/osmo-gmr/
ADD src /gnuradio/osmo-gmr/src/
ADD utils /gnuradio/osmo-gmr/utils/
ADD libosmocom.patch /gnuradio/osmo-gmr/

RUN cd /gnuradio/osmo-gmr && patch -p0 < libosmocom.patch
RUN cd /gnuradio/osmo-gmr  && autoreconf -i -f && ./configure && make && make install && ldconfig
RUN cd /gnuradio/osmo-gmr/utils/gmr_multi_rx && make TARGET=uhd && make install && ldconfig

ENTRYPOINT      ["/bin/bash"]

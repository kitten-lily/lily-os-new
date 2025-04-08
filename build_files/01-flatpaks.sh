#!/bin/bash

set -ouex pipefail

cat /usr/share/ublue-os/just/60-custom.just | sed 's/ublue-os\/bluefin\/main\/\${FLATPAKS}/kitten-lily\/lily-os-new\/main\/\${FLATPAKS}/' > /usr/share/ublue-os/just/60-ublue-custom.just
rm /usr/share/ublue-os/just/60-custom.just

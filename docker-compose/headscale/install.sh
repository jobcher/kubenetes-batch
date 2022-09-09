#!/bin/bash
mkdir -p /opt/headscale
mkdir -p ./config
touch ./config/db.sqlite
curl https://raw.githubusercontent.com/juanfont/headscale/main/config-example.yaml -o ./config/config.yaml

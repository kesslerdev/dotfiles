#!/usr/bin/env bash

/home/linuxbrew/.linuxbrew/bin/fnm install --latest
/home/linuxbrew/.linuxbrew/bin/fnm use latest || echo "not in shell"

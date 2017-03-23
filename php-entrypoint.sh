#!/bin/sh
set -e

# start apache server
exec httpd -DFOREGROUND

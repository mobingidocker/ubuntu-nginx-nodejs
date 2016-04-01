#!/usr/bin/env bash

set -x

until curl -vf localhost | grep Node ; do
  sleep 1
done


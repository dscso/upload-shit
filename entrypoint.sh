#!/bin/sh

chown -R app:app *
su app -c "$@"
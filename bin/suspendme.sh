#!/bin/sh

dbus-send --print-reply --system                         \
    --dest=org.freedesktop.login1                        \
    /org/freedesktop/login1                              \
    org.freedesktop.login1.Manager.Suspend boolean:true

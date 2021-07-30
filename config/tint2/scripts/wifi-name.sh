#!/bin/sh

echo " $(iwgetid | awk -F '"' '{ print $2 }')"

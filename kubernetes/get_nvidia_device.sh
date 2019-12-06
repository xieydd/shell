#!/bin/bash
devs=$(ls /dev/ | egrep '^nvidia[0-9]') && echo stub devices: $devs

#!/bin/bash

pacman -Syu --needed $(< pacman-utils.list tr "\n" " ")
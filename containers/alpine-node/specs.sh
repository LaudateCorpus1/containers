#!/bin/sh -x

alpineVer=$(cat /etc/alpine-release)
sysInfo=$(uname -a)
nodeVer=$(node --version)
npmVer=$(npm --version)
pnpmVer=$(pnpm --version)

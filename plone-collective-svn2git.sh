#!/bin/bash

###
#
#  Script to migrate a repository from the subversion collective to a
#  git repository.
#
#  Based on: https://github.com/collective/collective.github.com/blob/master/old-svn.rst#make-a-proper-git-svn-fork
#
###
#
# Requires:
# - svn2git [github.com/nirvdrum/svn2git]
# - git-svn
#
###
#
# TODO: 
#
###


set -e

SVN2GIT=${SVN2GIT:-svn2git}

[ -x $SVN2GIT ] ||
{
    echo "The given svn2git ($SVN2GIT) does not exist or is not executable."
    exit 1
}

BASEDIR="${PWD}"
ADDON=$1
REPO_URL=http://svn.plone.org/svn/collective/${ADDON}

# Create work directory
mkdir -vp "${ADDON}"
pushd "${ADDON}"

[ -f log.svn.txt ] ||
svn log -q ${REPO_URL} \
    >log.svn.txt

[ -f authors-transform.txt ] ||
{ cat log.svn.txt \
    | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' \
    | sort -u \
    >authors-transform.txt

    $EDITOR authors-transform.txt
}

REV0=$(tail -n2 log.svn.txt | head -n1 | awk '{print $1}' | sed "s/r//")
[ -z "${REV0}" ] && {
    echo Could not calculate the starting revision.
    exit 1
}

REV1=$(head -n2 log.svn.txt | tail -n1 | awk '{print $1}' | sed "s/r//")
[ -z "${REV1}" ] && {
    echo Could not calculate the ending revision.
    exit 1
}

mkdir -p master
cd master

${SVN2GIT} \
    --authors ../authors-transform.txt \
    --revision ${REV0}:${REV1} \
    -v \
    ${REPO_URL}

popd

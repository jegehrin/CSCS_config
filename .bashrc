# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# add osm or owm binaries to my path
if [[ `hostname` == kesch* ]] || [[ `hostname` == escha* ]]
then
    OPRUSER=owm                        #for kesch/escha
    OPRUSERPATH=/oprusers/${OPRUSER}
    export MODULEPATH=${MODULEPATH}:/oprusers/owm/modules/escha/modulefiles
    . /etc/bash_completion.d/git
    test -s /etc/bashrc && . /etc/bashrc
    module load R
    module load UDUNITS
    module load netCDF
    module load ncview
else
    OPRUSER=osm
    OPRUSERPATH=/users/${OPRUSER}
fi

if [[ "$(hostname)" = "lema"* ]] ; then 
    module load git
    module load netcdf
    module load ncview
    module load idl
    module load perl
    module load cdo
    export PATH=${PATH}:/users/jgehring/verify/synop/bin
fi


if test -n "${PATH}"
then
  PATH=${PATH}:${OPRUSERPATH}/bin
else
  PATH=${OPRUSERPATH}/bin
fi
# add local bin
PATH=${PATH}:/users/$USER/bin
export PATH

# Default editor for Crontab, CVS, etc.
export EDITOR=emacs
export MCH_PRINTER="pr36"
export SVN_EDITOR="emacs -nw"

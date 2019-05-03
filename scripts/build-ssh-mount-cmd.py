#!/usr/bin/env python

import argparse
import os
import sys

options = {
    'user': os.environ['USER'],
    'identity_file': '~/.ssh/id_rsa',
}

parser = argparse.ArgumentParser()

parser.add_argument(
    '--identity_file', '-i',
    help='Identity file'
)

parser.add_argument(
    '--user', '-u',
    help='Username'
)

parser.add_argument(
    'host',
    help='Remote host'
)

parser.add_argument(
    'remote_dir',
    help='Remote path to mount locally'
)

parser.add_argument(
    'local_dir',
    help='Local mountpoint'
)

args = parser.parse_args()

args = {k: v for k,v in vars(args).items() if v != None}
options.update(args)

sys.stdout.write("sudo sshfs -o allow_other,defer_permissions,IdentityFile={} {}@{}:{} {}".format(options['identity_file'], options['user'], options['host'], options['remote_dir'], options['local_dir']))

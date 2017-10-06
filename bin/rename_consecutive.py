#!/usr/bin/env python

import glob
import sys
import os
import argparse


def rename(folder, ext):
    curr_idx = 1
    prefix = 'f_'
    for f in glob.glob(os.path.join(folder, '*.%s' % ext)):
        os.rename(f, '{prefix:s}{idx:05d}.{ext:%s}'.format(prefix=prefix, idx=curr_idx, ext=ext))
        curr_idx += 1


def main():
    rename(sys.argv[1], sys.argv[2])


main()

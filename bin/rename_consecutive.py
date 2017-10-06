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
    parser = argparse.ArgumentParser(description='Rename files to have consecutive names')
    parser.add_argument('-d', '--folder',
                        help='Path to folder', metavar='DIR', required=True)

    parser.add_argument('-e', '--extension',
                        help='File extension', metavar='EXT', default='JPG')

    args = parser.parse_args()

    rename(args.folder, args.extension)


if __name__ == "__main__":
    sys.exit(main())

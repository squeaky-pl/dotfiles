#!/usr/bin/python

import subprocess


options = ['caps:swapescape', 'compose:rwin']
layouts = [('us', 'altgr-intl'), ('pl', None)]


def get_current_layout():
    split = subprocess.check_output(['setxkbmap', '-query']).split()
    pairs = dict(zip((k[:-1] for k in split[::2]), split[1::2]))
    return pairs['layout'], pairs.get('variant')


def set_layout(layout, variant):
    cmd = ['setxkbmap', '-layout', layout]
    if variant:
        cmd.extend(['-variant', variant])
    for option in options:
        cmd.extend(['-option', option])
    subprocess.check_call(cmd)


def toggle():
    try:
        next_layout = layouts[
            (layouts.index(get_current_layout()) + 1) % len(layouts)]
    except ValueError:
        next_layout = layouts[0]

    set_layout(*next_layout)

    return next_layout


if __name__ == '__main__':
    print(toggle())

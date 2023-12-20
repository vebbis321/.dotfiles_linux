#!/usr/bin/env bash
tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr;

#!/bin/bash
[[ -d ~/Archives-0003/Library/Imagery/Personal/Screenshots/2021 ]] || mkdir ~/Archives-0003/Library/Imagery/Personal/Screenshots/2021
flameshot &
flameshot gui -r -p ~/Archives-0003/Library/Imagery/Personal/Screenshots/2021 | xclip -sel c -t image/png
pkill flameshot

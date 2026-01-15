#!/usr/bin/env bash

START_R=255
START_G=255
START_B=0   # white

END_R=255
END_G=0
END_B=0     # light blue

read -r -d '' TEXT << 'EOF'
📜 OFFICIAL PASTAFARIAN BLESSING 📜

By the saucy authority of the
Minister of the Church of the Flying Spaghetti Monster 🍝

These scripts are hereby released unto the world,
freely shared, lovingly tangled, and mildly overcooked.

May your builds be stable,
your dependencies resolved,
and your merge conflicts few.

If something breaks,
it was probably touched by a noodly appendage.
R'amen.

⠀⠀⠀⠀⠀⠀⢀⣤⣀⣀⣀⠀⠻⣷⣄
⠀⠀⠀⠀⢀⣴⣿⣿⣿⡿⠋⠀⠀⠀⠹⣿⣦⡀
⠀⠀⢀⣴⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⢹⣿⣧
⠀⠀⠙⢿⣿⡿⠋⠻⣿⣿⣦⡀⠀⠀⠀⢸⣿⣿⡆
⠀⠀⠀⠀⠉⠀⠀⠀⠈⠻⣿⣿⣦⡀⠀⢸⣿⣿⡇
⠀⠀⠀⠀⢀⣀⣄⡀⠀⠀⠈⠻⣿⣿⣶⣿⣿⣿⠁
⠀⠀⠀⣠⣿⣿⢿⣿⣶⣶⣶⣶⣾⣿⣿⣿⣿⡁
⢠⣶⣿⣿⠋⠀⠀⠉⠛⠿⠿⠿⠿⠿⠛⠻⣿⣿⣦⡀
⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⡿

EOF

LEN=${#TEXT}
(( LEN < 2 )) && LEN=2

for (( i=0; i<${#TEXT}; i++ )); do
    C="${TEXT:i:1}"

    # ratio = i / (LEN-1)
    R=$(( START_R + (END_R - START_R) * i / (LEN - 1) ))
    G=$(( START_G + (END_G - START_G) * i / (LEN - 1) ))
    B=$(( START_B + (END_B - START_B) * i / (LEN - 1) ))

    printf "\e[38;2;%d;%d;%dm%s" "$R" "$G" "$B" "$C"
done

printf "\e[0m\n"


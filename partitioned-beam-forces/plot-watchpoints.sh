#!/usr/bin/env sh

EXPERIMENT="uni-directional (forces), dt=0.01"

FILE1="./beam-right-openradioss/precice-Beam-Right-watchpoint-Watchpoint-Right-Upper.log"
TITLE1="R: Forces.y at y=0.4"

FILE2="./beam-right-openradioss/precice-Beam-Right-watchpoint-Watchpoint-Right-Lower.log"
TITLE2="R: Forces.y at y=0.1"

FILE3="./beam-left-openradioss/precice-Beam-Left-watchpoint-Watchpoint-Left-Upper.log"
TITLE3="L: Forces.y at y=0.4"

FILE4="./beam-left-openradioss/precice-Beam-Left-watchpoint-Watchpoint-Left-Lower.log"
TITLE4="L: Forces.y at y=0.1"

gnuplot -p << EOF                                                               
	set grid                                                                        
	set title 'FORCES (y-component) - $EXPERIMENT'
	set xlabel 'time [s]'
	set ylabel 'FORCES (y-component) [N]'
  set term pngcairo enhanced size 900,654
  set output "images/watchpoints.png"
	plot [0.0:3.0] \
       "$FILE1" using 1:6 with lines title "$TITLE1",\
       "$FILE2" using 1:6 with lines title "$TITLE2",\
       "$FILE3" using 1:6 with lines title "$TITLE3",\
       "$FILE4" using 1:6 with lines title "$TITLE4"
EOF

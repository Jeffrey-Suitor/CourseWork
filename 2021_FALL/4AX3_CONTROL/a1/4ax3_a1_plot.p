set ylabel 'Signal'
set xlabel 'Time'
set xrange[:2050]


set title 'n2-m3'
plot 'data.txt' lc rgb "grey",\
    'n2_m3.dat' with lines
set term png
set output "n2_m3.png"
replot


set title 'n2-m4'
plot 'data.txt' lc rgb "grey",\
    'n2_m4.dat' with lines
set term png
set output "n2_m4.png"
replot


set title 'n4-m4'
plot 'data.txt' lc rgb "grey",\
    'n4_m4.dat' with lines
set output "n4_m4.png"
replot


set title 'n4-m5'
plot 'data.txt' lc rgb "grey",\
    'n4_m5.dat' with lines
set output "n4_m5.png"
replot


set title 'n4-m64'
plot 'data.txt' lc rgb "grey",\
    'n4_m64.dat' with lines
set output "n4_m64.png"
replot

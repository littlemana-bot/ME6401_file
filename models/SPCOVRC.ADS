# Design C coverage requirement, fully self-looped.
# Keep at least one UAV exploring whenever a controllable choice allows it.
# Loss of contact ends exploration like a fault. All states marked.
SPCOVRC
State size
4
Marker states:
0
1
2
3
Vocal states:

Transitions:
0 1 1
2 1 3
3 3 2
1 2 0
3 2 2
1 4 0
3 4 2
0 10 1
2 10 3
0 11 1
2 11 3
0 13 2
1 13 3
3 15 1
2 14 0
3 14 1
2 16 0
3 16 1
0 22 2
1 22 3
0 23 2
1 23 3
1 24 0
3 24 2
2 26 0
3 26 1
0 5 0
0 6 0
0 8 0
0 9 0
0 17 0
0 18 0
0 20 0
0 21 0
1 5 1
1 6 1
1 8 1
1 9 1
1 17 1
1 18 1
1 20 1
1 21 1
2 5 2
2 6 2
2 8 2
2 9 2
2 17 2
2 18 2
2 20 2
2 21 2
3 5 3
3 6 3
3 8 3
3 9 3
3 17 3
3 18 3
3 20 3
3 21 3

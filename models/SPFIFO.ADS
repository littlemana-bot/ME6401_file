# Design C requirement, fully self-looped.
# If both UAVs are down, the one that faulted first must be repaired first.
# 0 neither down, 1 only UAV1, 2 only UAV2,
# 3 both (UAV1 faulted first), 4 both (UAV2 faulted first).
# Event 17 is absent in state 3 and event 5 in state 4. All states marked.
SPFIFO
State size
5
Marker states:
0
1
2
3
4
Vocal states:

Transitions:
0 4 1
0 24 1
0 16 2
0 26 2
1 16 3
1 26 3
1 6 0
2 4 4
2 24 4
2 18 0
3 6 2
4 18 1
0 5 0
0 17 0
1 5 1
1 17 1
2 5 2
2 17 2
3 5 3
4 17 4
0 1 0
0 2 0
0 3 0
0 8 0
0 9 0
0 10 0
0 11 0
0 13 0
0 14 0
0 15 0
0 20 0
0 21 0
0 22 0
0 23 0
1 1 1
1 2 1
1 3 1
1 8 1
1 9 1
1 10 1
1 11 1
1 13 1
1 14 1
1 15 1
1 20 1
1 21 1
1 22 1
1 23 1
2 1 2
2 2 2
2 3 2
2 8 2
2 9 2
2 10 2
2 11 2
2 13 2
2 14 2
2 15 2
2 20 2
2 21 2
2 22 2
2 23 2
3 1 3
3 2 3
3 3 3
3 8 3
3 9 3
3 10 3
3 11 3
3 13 3
3 14 3
3 15 3
3 20 3
3 21 3
3 22 3
3 23 3
4 1 4
4 2 4
4 3 4
4 8 4
4 9 4
4 10 4
4 11 4
4 13 4
4 14 4
4 15 4
4 20 4
4 21 4
4 22 4
4 23 4

# Design C ground rescue team: ONE team with two duties.
# State 0 idle, 1 rescuing, 2 repairing UAV1, 3 repairing UAV2.
# Transitions 2-21-1 and 3-9-1 abort a repair in order to answer a call.
TEAM
State size
4
Marker states:
0
Vocal states:

Transitions:
0 9 1
0 21 1
2 21 1
3 9 1
1 10 0
1 22 0
0 5 2
2 6 0
0 17 3
3 18 0

# Design C UAV1 plant model.
# State 3 = down (fault 4 or loss of contact 24), awaiting ground recovery.
# Odd labels are controllable, even labels uncontrollable.
UAV1C
State size
6
Marker states:
0
1
Vocal states:

Transitions:
0 1 1
1 3 0
1 2 2
1 4 3
1 24 3
3 5 3
3 6 0
2 8 4
4 9 5
4 11 1
5 10 1

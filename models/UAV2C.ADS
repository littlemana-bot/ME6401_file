# Design C UAV2 plant model.
# State 3 = down (fault 16 or loss of contact 26), awaiting ground recovery.
# Odd labels are controllable, even labels uncontrollable.
UAV2C
State size
6
Marker states:
0
1
Vocal states:

Transitions:
0 13 1
1 15 0
1 14 2
1 16 3
1 26 3
3 17 3
3 18 0
2 20 4
4 21 5
4 23 1
5 22 1

timer = 20;
missileCon = 0;
tracker = irandom(4);
target_x = (pattern == 3) ? x : obj_susiezilla.x;
if (pattern == 2)
    target_y = random_range(200, 300);
else
    target_y = (pattern == 3) ? y : obj_susiezilla.y;
dir = choose(-1, 1);
if (pattern == 2 || pattern == 5)
    missilecap = 9;
else
    missilecap = 4;

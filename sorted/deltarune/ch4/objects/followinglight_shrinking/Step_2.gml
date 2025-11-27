if (obj_mainchara.x > (x + edge_right))
    follow_x_target = obj_mainchara.x - edge_right;
if (obj_mainchara.x < (x - edge_left))
    follow_x_target = obj_mainchara.x + edge_left;
x = scr_movetowards(x, follow_x_target, 12);
y = lerp(y, obj_mainchara.y + 18, 0.5);
depth = obj_mainchara.depth - 200;
event_inherited();

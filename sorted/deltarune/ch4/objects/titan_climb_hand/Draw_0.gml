var shake_x = 0;
var shake_y = 0;
if (shake_active)
{
    shake_x = random_range(-4, 4);
    shake_y = random_range(-6, 6);
}
draw_sprite_ext(arm_sprite, 0, x + shake_x, y + shake_y, 2, 2, base_rot, c_white, 1);
draw_sprite_ext(hand_sprite, 0, x + shake_x, y + shake_y, 2, 2, base_rot, c_white, 1);
for (var i = 0; i < 4; i++)
{
    var _c = dcos(base_rot);
    var _s = dsin(base_rot);
    var x_offset = -54 + (i * 52);
    var y_offset = -128;
    if (i == 1)
    {
        y_offset += -8;
    }
    else if (i == 2)
    {
        y_offset += -2;
        x_offset += 0;
    }
    else if (i == 3)
    {
        y_offset += 12;
    }
    var _x = x + (_c * x_offset) + (_s * y_offset);
    var _y = (y + (_c * y_offset)) - (_s * x_offset);
    draw_sprite_ext(finger_sprite, finger_anim + (i * 0.2), _x + shake_x, _y + shake_y, 2, 2, base_rot, c_white, 1);
}

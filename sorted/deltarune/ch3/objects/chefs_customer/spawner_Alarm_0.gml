if (obj_chefs_game.gameover)
    exit;
var _max = obj_chefs_game.timer_max;
var _t = clamp(obj_chefs_game.timer, 50, _max);
var _r = (_max - _t) / _max;
alarm[0] = 90 - (30 * _r);
var _cust = instance_create(room_width + 32, room_height - 100, obj_chefs_customer);
with (_cust)
{
    image_xscale = 2;
    hspeed = -2;
}
if (obj_chefs_game.timer < special_timer)
{
    _cust = instance_create(-32, room_height - 60, obj_chefs_customer);
    with (_cust)
    {
        special = true;
        image_xscale = 2;
        hspeed = 4;
        depth -= 2;
        set_spriteset(choose(1, 2));
    }
    switch (special_timer)
    {
        case 92:
            special_timer = 67;
            break;
        case 67:
            special_timer = 42;
            break;
        case 42:
            special_timer = 17;
            break;
        case 17:
            special_timer = -1;
            break;
    }
}

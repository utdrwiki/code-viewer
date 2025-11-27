if (!can_control)
    exit;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
press_1 = 0;
press_2 = 0;
if (left_h())
    press_l = 1;
if (right_h())
    press_r = 1;
if (up_h())
    press_u = 1;
if (down_h())
    press_d = 1;
if (button1_p())
    press_1 = 1;
if (button2_p())
    press_2 = 1;
px = 0;
py = 0;
if (press_r == 1)
    px = wspeed;
if (press_l == 1)
    px = -wspeed;
if (press_d == 1)
    py = wspeed;
if (press_u == 1)
    py = -wspeed;
var _xx = px;
var _yy = py;
var is_bumped = false;
if (place_meeting(x + _xx, y, obj_ch3_green_room_racing_solid))
{
    is_bumped = true;
    bkx = 0;
    if (px > 0)
    {
        for (i = px; i >= 0; i -= 1)
        {
            if (!place_meeting(x + i, y, obj_ch3_green_room_racing_solid))
            {
                px = i;
                bkx = 1;
                break;
            }
        }
    }
    if (px < 0)
    {
        for (i = px; i <= 0; i += 1)
        {
            if (!place_meeting(x + i, y, obj_ch3_green_room_racing_solid))
            {
                px = i;
                bkx = 1;
                break;
            }
        }
    }
    if (bkx == 0)
        px = 0;
}
if (place_meeting(x, y + _yy, obj_ch3_green_room_racing_solid))
{
    is_bumped = true;
    bky = 0;
    if (py > 0)
    {
        for (i = py; i >= 0; i -= 1)
        {
            if (!place_meeting(x, y + i, obj_ch3_green_room_racing_solid))
            {
                py = i;
                bky = 1;
                break;
            }
        }
    }
    if (py < 0)
    {
        for (i = py; i <= 0; i += 1)
        {
            if (!place_meeting(x, y + i, obj_ch3_green_room_racing_solid))
            {
                py = i;
                bky = 1;
                break;
            }
        }
    }
    if (bky == 0)
        py = 0;
}
var won = false;
if (place_meeting(x + _xx, y, obj_ch3_green_room_racing_goal))
{
    is_bumped = false;
    won = true;
    bkx = 0;
    if (px > 0)
    {
        for (i = px; i >= 0; i -= 1)
        {
            if (!place_meeting(x + i, y, obj_ch3_green_room_racing_goal))
            {
                px = i;
                bkx = 1;
                break;
            }
        }
    }
    if (px < 0)
    {
        for (i = px; i <= 0; i += 1)
        {
            if (!place_meeting(x + i, y, obj_ch3_green_room_racing_goal))
            {
                px = i;
                bkx = 1;
                break;
            }
        }
    }
    if (bkx == 0)
        px = 0;
}
if (!is_bumped)
{
    if (sfx_buffer_timer > 0)
        sfx_buffer_timer--;
}
_xx = px;
_yy = py;
x += _xx;
y += _yy;
player_moved = px != 0 || py != 0;
if (sfx_honk_buffer_timer <= 0)
{
    if (player_moved)
    {
        sfx_honk_buffer_timer = sfx_honk_buffer;
        snd_play_x(snd_carhonk, 0.25, 1.8);
    }
}
else
{
    sfx_honk_buffer_timer--;
}
if (won)
    win();
if (is_bumped && sfx_buffer_timer <= 0)
    bump_car();

scr_board_enemy_step_init();
scr_depth_board();
if (room == room_shadowmantle)
{
    timer++;
    if (timer > 76)
    {
        active = false;
        if (visible == true)
            visible = false;
        else
            visible = true;
    }
    if (timer == 96)
        instance_destroy();
}
if (place_meeting(x, y, obj_board_solid))
{
}
if (place_meeting(x - 4, y, obj_board_solid))
{
    if (direction == 225)
        direction = 315;
    if (direction == 135)
        direction = 45;
    if (room != room_shadowmantle)
    {
        snd_stop(snd_bump);
        snd_play(snd_bump);
    }
}
if (place_meeting(x, y - 4, obj_board_solid))
{
    if (direction == 45)
        direction = 315;
    if (direction == 135)
        direction = 225;
    if (room != room_shadowmantle)
    {
        snd_stop(snd_bump);
        snd_play(snd_bump);
    }
}
if (place_meeting(x, y + 4, obj_board_solid))
{
    if (direction == 315)
        direction = 45;
    if (direction == 225)
        direction = 135;
    if (room != room_shadowmantle)
    {
        snd_stop(snd_bump);
        snd_play(snd_bump);
    }
}
if (place_meeting(x + 4, y, obj_board_solid))
{
    if (direction == 45)
        direction = 135;
    if (direction == 315)
        direction = 225;
    if (room != room_shadowmantle)
    {
        snd_stop(snd_bump);
        snd_play(snd_bump);
    }
}

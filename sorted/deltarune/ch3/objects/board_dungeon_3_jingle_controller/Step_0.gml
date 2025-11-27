if (killcount == 68)
{
    snd_play(snd_board_ominous);
    killcount++;
}
if (con == 1)
{
    var trig = 0;
    with (obj_board_enemy_bluefish)
    {
        if (silverfishcon == 1)
            trig = 1;
    }
    if (trig == 1)
    {
        con = 2;
        snd_play(snd_board_door_close, 0.8, 0.6);
        snd_play(snd_board_door_close, 0.8, 0.8);
        block = instance_create(board_tilex(8), board_tiley(3), obj_board_solid);
        with (block)
        {
            scr_size(128, 64);
            sprite_index = spr_pxwhite;
            image_blend = c_black;
            depth = 999999;
            visible = true;
        }
    }
}
if (con == 2)
{
    if (!i_ex(obj_board_enemy_bluefish) && !i_ex(obj_board_enemy_lizard))
    {
        con = 3;
        scr_delay_var("con", 4, 15);
    }
}
if (con == 4)
{
    snd_play(snd_board_door_close, 0.8, 1.1);
    snd_play(snd_board_door_close, 0.6, 0.8);
    safe_delete(block);
    con++;
}

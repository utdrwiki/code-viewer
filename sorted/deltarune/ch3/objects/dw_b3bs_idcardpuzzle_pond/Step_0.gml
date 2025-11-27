animindex += 0.125;
if (con == 0)
{
    timer++;
    if (tearbuff == 15)
    {
        snd_stop(snd_board_splash);
        snd_play_x(snd_board_splash, 0.6, 1.4);
    }
    if (tearbuff > 0)
        tearbuff--;
    if (tearbuff <= 0)
    {
        if ((timer % 6) == 0)
            amt--;
    }
    amt = clamp(amt, 0, 42);
    if (amt >= 42)
    {
        snd_play(snd_board_secret_normal);
        timer = 0;
        if (room == room_dw_b3bs_idcardpuzzle)
        {
            con = 1;
            global.flag[1097] = 1;
            scr_lerpvar("waterfalllength", -16, 64, 45, 3, "in");
        }
        if (room == room_dw_b3bs_rouxls_lanina)
        {
            global.flag[1107] = 1;
            for (var i = 0; i < 3; i++)
            {
                instance_create(x + (i * 32), y, obj_board_watertile);
                instance_create(x + (i * 32), y + 32, obj_board_watertile);
            }
            safe_delete(mysolid);
            scr_doom(id, 2);
            con = 10;
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
        keycard.yamt = 4;
    if (timer == 60)
        scr_lerpvar_instance(keycard, "vspeed", 0, 2, 15, 2, "out");
    if (timer == 80)
    {
        keycard.yamt = 4;
        keycard.vspeed = -2;
        keycard.gravity = 0.45;
        snd_play(snd_fall);
        timer = 0;
        con++;
    }
}
if (con == 2)
{
    if (i_ex(keycard))
    {
        if (keycard.y >= 190)
        {
            snd_play(snd_noise);
            with (instance_create(x + 32 + 8, 196, obj_board_pickup))
            {
                type = "idcard";
                image_alpha = 1;
                sprite_index = spr_board_keycard;
                con = 2;
            }
            safe_delete(keycard);
            timer = 0;
            con = 3;
        }
    }
}

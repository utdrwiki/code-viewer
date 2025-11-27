if (con == 0)
{
    if (y > (cameray() + cameraheight()))
    {
        y = cameray() + cameraheight() + 10;
        sprite_index = spr_kris_jump_ball;
        image_speed = 1;
        gravity = 0;
        vspeed = 0;
        obj_overworldheart.image_alpha = 0;
        con = 1;
        if (room == room_dw_church_dogclimb)
            con = 0.5;
    }
}
if (con == 0.5)
{
    timer++;
    if (timer == 1)
    {
        scr_fadeout(10);
        persistent = true;
    }
    if (timer == 30)
    {
        snd_free(global.currentsong[0]);
        room_restart();
    }
    if (timer == 31)
    {
        scr_fadein(10);
        with (obj_fadein)
            persistent = 1;
        global.interact = 0;
        instance_destroy();
    }
}
if (con == 1)
{
    timer++;
    if (timer == 30)
    {
        snd_play(snd_jump);
        vspeed = -22;
        gravity = 0.7;
    }
    if (timer >= 30 && timer < 33 && vspeed <= 0)
    {
    }
    if (timer > 31 && vspeed != 0)
    {
        with (obj_rotating_tower_controller)
        {
            obj_rotating_tower_controller.yoffset_prev += 2;
            obj_rotating_tower_controller.yoffset += 2;
            obj_rotating_bg_controller.tunnel_offset_y += 1;
        }
        timer = 31;
    }
    if (vspeed > 2 && y > obj_mainchara.y)
    {
        y = obj_mainchara.y;
        visible = false;
        gravity = 0;
        vspeed = 0;
        global.interact = 0;
        snd_play(snd_grab);
    }
    if (timer > 31)
    {
        if (obj_mainchara.visible == 0)
            obj_mainchara.visible = 1;
        else
            obj_mainchara.visible = 0;
    }
    if (timer == 32)
    {
    }
    if (timer == 80)
    {
        global.interact = 0;
        obj_mainchara.visible = 1;
        obj_overworldheart.image_alpha = 1;
        instance_destroy();
    }
}
obj_mainchara.battleheart.x = x + 12;
obj_mainchara.battleheart.y = y + 28;

if (con == 0)
{
    var rate = 4;
    timer++;
    if (timer == 1)
        image_alpha = 1;
    if (timer == (rate * 2))
    {
        image_index = 0;
        scale *= -1;
    }
    if (timer == (rate * 4))
    {
        image_index = 1;
        scale *= -1;
    }
    if (timer == (rate * 6))
    {
        image_index = 1;
        scale *= -1;
    }
    for (var i = 7; i < 16; i++)
    {
        if (timer == (rate * i))
        {
            image_index = 2;
            scale *= -1;
        }
    }
    if (timer >= (rate * 16))
    {
        var chosen = special;
        var amt = ((y - 64) / 32) * 0.25;
        var amt2 = ((x - 128) / 32) * 0.25;
        snd_play_x(snd_board_lift, 0.5, 2 + amt + amt2);
        crab = instance_create(x, y - 4, obj_board_marker);
        with (crab)
        {
            sprite_index = spr_board_crab;
            if (chosen)
            {
                extflag = "crab";
                sprite_index = spr_board_crab_blue;
            }
            image_speed = 0.125;
            scr_limitval_upper(id, "y", y);
            vspeed = -random_range(6, 8);
            gravity = 0.45;
            scr_darksize(id);
            scr_depth_board();
            daddy = other.id;
        }
        timer = 0;
        con++;
    }
}
if (con == 1)
{
    timer++;
    if (timer > 15)
    {
        if (crab.y >= crab.ystart)
        {
            snd_play_x(snd_board_splash, 0.25, 2.4);
            snd_play_delay(snd_board_splash, 2, 0.125, 2.4);
            safe_delete(crab);
            con = 2;
            timer = 0;
        }
    }
}
if (con == 2)
{
    timer++;
    var rate = 2;
    if (timer == (1 * rate))
        image_index--;
    if (timer == (2 * rate))
        image_index--;
    if (timer == (3 * rate))
        instance_destroy();
}
if (obj_board_camera.shift != "none")
    instance_destroy();
if (done == 1)
{
    donetimer++;
    if (donetimer == 10)
    {
        with (instance_create(crab.x + 16, crab.y + 16, obj_board_perfumefountainphotoeffect))
        {
            mydist = 32;
            depth = other.depth - 10;
        }
    }
    if (donetimer == 150)
    {
        con = 1;
        timer = 15;
        crab.gravity = 0.5;
    }
}

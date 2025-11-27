scr_depth();
if (mode == 0)
{
    if (con == 0 && myinteract == 1)
    {
        snd_play(snd_wing);
        lid = instance_create(x, y, obj_marker);
        lid.depth = depth - 100;
        lid.vspeed = -4 * multiplier;
        lid.friction = -0.2 * multiplier;
        lid.sprite_index = sprite_index;
        lid.image_speed = 0;
        lid.image_index = 2;
        lid.image_xscale = 2;
        lid.image_yscale = 2;
        image_index = 1;
        myinteract = 0;
        con = 1;
        makecontent = 0;
        if (content >= 2)
        {
            makecontent = 1;
            contentmarker = instance_create(x + xoffset, y + yoffset, obj_marker);
            contentmarker.depth = depth - 1;
            contentmarker.sprite_index = contentsprite;
            contentmarker.image_speed = 0.1 * multiplier;
            contentmarker.image_xscale = 2;
            contentmarker.image_yscale = 2;
        }
    }
}
if (mode == 1)
{
    if (con == 0 && myinteract == 1)
    {
        if (montyboss == 0 || montyboss == 1)
            snd_play(snd_wing);
        siner = 0;
        lid = instance_create(x, y, obj_marker);
        lid.depth = depth - 100;
        lid.sprite_index = sprite_index;
        lid.image_speed = 0;
        lid.image_index = 2;
        lid.image_xscale = 2;
        lid.image_yscale = 2;
        image_index = 1;
        myinteract = 0;
        con = 1;
        makecontent = 1;
        contentmarker = instance_create(x, y, obj_marker);
        contentmarker.sprite_index = spr_dw_green_room_tv_dinner;
        contentmarker.depth = depth - 1;
        contentmarker.image_speed = 0.1 * multiplier;
        contentmarker.image_xscale = 2;
        contentmarker.image_yscale = 2;
        var rand = irandom(99);
        if (rand == 1)
            contentmarker.sprite_index = spr_ch2_gimmick_saucer_dog;
    }
    if (con == 1)
    {
        done = 0;
        siner += 1;
        if (content == 1)
            height = sin(siner / (8 / multiplier)) * 60;
        else
            height = sin(siner / (15 / multiplier)) * 80;
        lid.y = lid.ystart - height;
        if (siner >= 10 && height <= 0)
        {
            if (montyboss == 0 || montyboss == 1)
                snd_play(snd_metalhit);
            height = 0;
            siner = 0;
            con = 0;
            myinteract = 0;
            lid.y = lid.ystart;
            image_index = 0;
            with (lid)
                instance_destroy();
            if (makecontent == 1)
            {
                with (contentmarker)
                    instance_destroy();
            }
        }
    }
}

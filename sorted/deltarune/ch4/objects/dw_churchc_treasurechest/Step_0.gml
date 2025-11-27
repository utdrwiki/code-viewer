scr_populatechars();
if (!init)
{
    with (obj_treasure_room)
        image_blend = c_black;
    if (global.flag[1595] == 0)
    {
        var block = scr_genmarker("hideaway");
        solidarea = instance_create(block.x, block.y, obj_solidblock);
        with (solidarea)
        {
            sprite_index = block.sprite_index;
            scr_sizeexact(block.sprite_width, block.sprite_height);
            depth = layer_get_depth("RIPPLEWALLS");
            visible = true;
            image_blend = c_black;
        }
        var pos = scr_genmarker("switchloc");
        floorswitch = instance_create(pos.x, pos.y, obj_dw_church_glowtile);
        floorswitch.doripple = false;
    }
    init = 1;
}
if (i_ex(floorswitch))
{
    with (floorswitch)
    {
        if (pressed)
        {
            snd_play(snd_churchbell_long, 1, 1);
            with (other.solidarea)
            {
                scr_afterimage();
                instance_destroy();
            }
            global.flag[1595] = 1;
            scr_fancy_ripple_alt(x, y, 270, 65535, 2500, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 2300, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 2100, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 1900, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 1700, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 1500, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 1300, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 1100, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 900, 1, 15, 1999980, undefined, undefined, undefined, 1);
            scr_fancy_ripple_alt(x, y, 270, 65535, 700, 1, 15, 1999980, undefined, undefined, undefined, 1);
            other.con = 1;
            instance_destroy();
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 200)
        con = 2;
}

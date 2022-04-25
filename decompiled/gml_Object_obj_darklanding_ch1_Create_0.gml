if (global.plot < 16)
{
    con = 1
    global.interact = 1
    with (obj_mainchara_ch1)
    {
        fun = true
        sprite_index = spr_kris_fallen_dark_ch1
    }
    alarm[4] = 45
}
else
{
    con = 99
    if scr_havechar_ch1(3)
    {
        rd = instance_create_ch1(240, 240, obj_readable_room1_ch1)
        rd.image_xscale = 8
        rd.image_yscale = 2
    }
}

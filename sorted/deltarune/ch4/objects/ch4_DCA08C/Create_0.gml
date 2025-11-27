if (scr_debug())
{
    scr_setparty(1, 1, 0);
    if (global.flag[850] < 2 || global.plot < 170)
    {
    }
    if (global.flag[850] < 2)
        global.flag[850] = 2;
    if (global.plot < 170)
        global.plot = 170;
}
visible = true;
depth = 5;
con = -1;
customcon = 0;
drawblack = false;
alph = 0;
hlinit = 0;
hl[0] = 0;
topblack = 0;
switch_marker = scr_dark_marker(920, 180, spr_dw_church_switch);
with (switch_marker)
{
    scr_depth();
    image_index = 0;
    visible = 0;
}
if (global.plot >= 170 && scr_flag_get(850) == 2)
{
    with (obj_followinglight_shrinking)
        instance_destroy();
    with (obj_darkness_overlay)
        active = false;
    drawblack = true;
    alph = 0.9;
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    ralsei_heal = false;
    ralsei_heal_timer = 0;
    if (global.tempflag[98] == 1)
    {
        hlinit = 1;
        con = -1;
        drawblack = false;
    }
    with (obj_border_controller)
        set_custom_effect(6, 1);
}
else if (global.plot >= 150)
{
    with (obj_darkness_overlay)
        active = false;
    hlinit = 1;
    instance_destroy();
    if (global.plot < 170)
    {
        if (scr_debug())
        {
            with (obj_border_controller)
            {
                set_border(border_dw_church_a, 1);
                show_border();
            }
        }
    }
}
else
{
    instance_create(720, 240, obj_solidblocksized);
    hlinit = 1;
    instance_destroy();
}
dovis = 0;
krlight = 0;
ralight = 0;
sulight = 0;

con = -1;
customcon = 0;
dark_fountain = instance_find(obj_ch4_DCA12_darkfountain, 0);
if (global.plot < 195)
    global.plot = 195;
if (global.plot >= 195 && global.plot < 200)
{
    con = 0;
    colcol = 0;
    image_speed = 0;
    image_xscale = 2;
    image_yscale = 2;
    siner = 0;
    made = 0;
    adjust = 0;
    global.interact = 1;
    y += 260;
    susx = x - 60;
    susy = y + 20;
    sussprite = spr_susieu_bright;
    susindex = 0;
    susie_turn_timer = 0;
    songplay = 0;
    with (obj_mainchara)
        visible = 0;
    fin = instance_create(0, 0, obj_fadein);
    with (fin)
        fadespeed = -0.005;
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
        instance_destroy(obj_caterpillarchara);
}
else
{
    instance_destroy();
}

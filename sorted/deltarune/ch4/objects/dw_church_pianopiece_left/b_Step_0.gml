scr_populatechars();
with (obj_floorswitch)
{
    if (other.con == 1)
        scr_marker_ext(x, y, sprite_index, 2, 2, 0, 1, undefined, 999990);
    instance_destroy();
}
if (con == 1)
{
    snd_play(snd_noise);
    global.flag[891] = 1;
    var xoff = -1040;
    var yoff = 120;
    global.tempflag[56] = 0;
    setxy(global.tempflag[50] + xoff, global.tempflag[51] + yoff, kris);
    setxy(global.tempflag[52] + xoff, global.tempflag[53] + yoff, susie);
    setxy(global.tempflag[54] + xoff, global.tempflag[55] + yoff, ralsei);
    scr_caterpillar_interpolate("all");
    with (obj_mainchara)
    {
        ignoredepth = 1;
        depth = 96399;
    }
    global.facing = 2;
    con = 1.01;
    with (scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, 0, undefined, c_black, 1000))
        scr_lerpvar("image_alpha", 1, 0, 6, -1, "out");
    with (scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, 0, undefined, c_blue, 1010))
        scr_lerpvar("image_alpha", 1, 0, 2, -1, "out");
    prophecyactive = 1;
}
if (con == 1.01)
{
    timer++;
    if (timer == 15)
        prophecyactive = 1;
    if (timer == 30)
    {
        with (obj_mainchara)
            ignoredepth = 0;
        global.interact = 1;
        global.facing = 2;
        con = 1.1;
    }
}
if (con == 1.1)
{
    con = 2;
    with (instance_create(x, y, obj_ch4_DCA08A))
        con = 1;
}
if (con == 1 && !i_ex(obj_ch4_DCA08A))
{
    con = 2;
    proptrig = 1;
}
if (con == 2)
    proptrig = 1;
if (proptrig == 1)
{
    prophecyactive = 0;
    prophecyactive = scr_trigcheck("prophecy");
}
roomglow.active = prophecyactive;
prophecy.active = prophecyactive;

buffer--;
if (obj_b2iceregion.ralseiworried >= 2)
{
    safe_delete(boatsolid);
    instance_destroy();
}
scr_board_populatevars();
scr_gameshow_populatevars();
if (con == 1)
{
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "UNDER CONSTRUCTION^1! KEEP OUT!/%", "obj_board_b2_watersign_slash_Step_0_gml_12_0");
    bw_make();
    con = 1.1;
}
if (con == 1.1 && !bw_ex())
    con = 1.999;
if (con == 1.999)
{
    if (global.flag[1022] == 1)
    {
        safe_delete(boatsolid);
        var sutalk = stringsetloc("He's not here, now's our chance.", "obj_board_b2_watersign_slash_Step_0_gml_24_0");
        scr_couchtalk(sutalk, "susie", 2, 90);
        con = 2;
    }
    else
    {
        con = 0;
        global.interact = 0;
        buffer = 3;
    }
}
if (con == 2)
{
    if (!i_ex(obj_couchwriter) || button1_p() || button3_h())
    {
        safe_delete(obj_couchwriter);
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    timer++;
    if (timer == 1)
    {
        obj_board_boat.updateplayerdepth = false;
        susie.fun = true;
        susie.depth -= 10;
    }
    if (timer == 15)
    {
        grabbed = true;
        snd_play(snd_board_lift);
        susie.fun = 1;
        susie.sprite_index = susie.usprite_carry;
        y = susie.y - 24;
        x = susie.x;
        depth = susie.depth - 10;
        updatedepth = false;
    }
    var xloc = susie.x - 128;
    if (xloc < board_tilex(2))
        xloc = susie.x + 128;
    if (timer == 25)
    {
        if (xloc < susie.x)
            susie.sprite_index = susie.lsprite_carry;
        else
            susie.sprite_index = susie.rsprite_carry;
    }
    var throwtime = 16;
    if (timer == 30)
    {
        snd_play(snd_board_throw);
        var yloc = round((susie.y + 32) / 32) * 32;
        scr_jump_to_point_board(xloc, yloc - 32, 12, throwtime);
    }
    if (timer == 31)
    {
        if (xloc < susie.x)
            susie.sprite_index = susie.lsprite;
        else
            susie.sprite_index = susie.rsprite;
    }
    if (timer == ((70 + throwtime) - 40))
    {
        susie.fun = 0;
        snd_play(snd_board_splash);
        with (object_index)
            decor = true;
        grabbed = false;
        obj_board_boat.canfreemove = true;
        obj_board_boat.updateplayerdepth = true;
        con++;
        timer = 0;
    }
}
if (con == 4)
{
    timer++;
    if (timer == 1)
        global.interact = 0;
    if (timer == 15)
    {
        boatsolid = instance_create(x, y, obj_board_boatsolid);
        scr_darksize(boatsolid);
        boatsolid.sprite_index = sprite_index;
    }
    if (obj_board_camera.shift == "left" || obj_board_camera.shift == "right" || obj_board_camera.shift == "down")
    {
        var sutalk = stringsetloc("Alright, sign thrown.", "obj_board_b2_watersign_slash_Step_0_gml_132_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
        var ratalk = stringsetloc("... that's what you meant!?", "obj_board_b2_watersign_slash_Step_0_gml_135_0");
        scr_script_delayed(scr_couchtalk, 40, ratalk, "ralsei", 2, 80);
        con = 0;
    }
    if (obj_board_camera.shift == "up")
        con = 0;
}

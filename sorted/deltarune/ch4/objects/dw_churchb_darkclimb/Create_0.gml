global.flag[23] = 1;
timer = 0;
con = 0;
init = false;
controlcon = 0;
shakecon = 0;
shaketilex = 0;
shaketiley = 0;
siner = 0;
siner2 = 0;
fakesu = -4;
snd = -4;
layer_set_visible("DEBUG_ASSETS", 0);
enemycloud = -4;
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("P")))
    {
        global.plot = 0;
        global.tempflag[90] = 1;
    }
}
cutscene = 0;
if (global.tempflag[90] == 1)
{
    scr_setparty(1);
    global.interact = 1;
    global.tempflag[90] = 0;
    cutscene = 1;
    with (obj_savepoint)
        image_alpha = 0;
    with (scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, 0))
    {
        scr_lerpvar("image_alpha", 1.25, 0, 60, 2, "in");
        scr_doom(id, 60);
    }
}
susie_monologue = [[stringsetloc("* Kris! Over here!/%", "obj_dw_churchb_darkclimb_slash_Create_0_gml_53_0")], [stringsetloc("* Gah^1! Get off of me^1! Why aren't my attacks working?/%", "obj_dw_churchb_darkclimb_slash_Create_0_gml_56_0")], [stringsetloc("* Thanks! I owe you one./%", "obj_dw_churchb_darkclimb_slash_Create_0_gml_59_0")], [stringsetloc("* Got you!/", "obj_dw_churchb_darkclimb_slash_Create_0_gml_62_0"), stringsetloc("* Be more careful, dumbass./", "obj_dw_churchb_darkclimb_slash_Create_0_gml_63_0"), stringsetloc("* C'mon! I see the top!/%", "obj_dw_churchb_darkclimb_slash_Create_0_gml_64_0")]];
write_top = false;
monologue_writer = -4;
monologuecon = -1;
monowatch = 0;
monotime = 0;
monocon = 0;
sujumpoff = -4;
suendcon = 0;
breakglass = 0;
mynpc = -4;
layer_set_visible("ENEM", 0);
if (global.plot >= 239)
{
    var spritesArray = layer_get_all_elements("ENEM");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 4929)
            mynpc = scr_makenpc_fromasset(spritesArray[i]);
    }
    with (mynpc)
    {
        var col = 16777215;
        other.mynpc = scr_marker_ext(marker.x, marker.y, marker.sprite_index, marker.image_xscale, marker.image_yscale, 0, undefined, col, undefined, 1);
        safe_delete(marker);
        instance_destroy();
    }
    con = 40;
}
enem = 0;
econ = 0;
enemtimer = 0;
encounterflag = 1790;
encounterno = 187;

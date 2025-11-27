init = 0;
timer = 0;
con = 0;
barrier1 = instance_create(600, 600, obj_solidblocksized);
barrier2 = instance_create(480, 480, obj_solidblocksized);
barrier3 = instance_create(600, 3560, obj_solidblocksized);
barrier4 = instance_create(480, 3680, obj_solidblocksized);
layer_set_visible("TILES_SLIDES", 0);
layer_set_visible("DEBUG_ASSETS", 0);
towercon = 10;
ialpha = 0;
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.plot = 0;
    if (keyboard_check(ord("1")))
    {
        global.plot = 238.5;
        scr_setparty(1);
    }
    if (keyboard_check(ord("2")))
        global.tempflag[90] = 0.1;
    if (global.tempflag[90] == 0.1)
    {
        global.plot = 238.61;
        scr_setparty(0);
    }
}
if (global.plot < 238.5)
{
    if (scr_debug())
        scr_setparty(1);
    global.plot = 238.5;
}
if (global.plot == 238.61)
    con = 2;
if (global.plot > 238.61)
    con = -1;
var lay_id = layer_get_id("BGCOLOR");
back_id = layer_background_get_id(lay_id);
susie_monologue = [[stringsetloc("* Gotta be honest^1, Kris. I've never.../", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_69_0"), stringsetloc("* I've never really gotten picked.../", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_70_0"), stringsetloc("* ..^1. for anything before./%", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_71_0")], [stringsetloc("* No one ever wanted to be my partner in class./", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_74_0"), stringsetloc("* ..^1. Even got chosen last in gym./%", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_75_0")], [stringsetloc("* But this...?/", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_78_0"), stringsetloc("* This is like..^1. Something else^1, y'know?/", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_79_0"), stringsetloc("* Something..^1. important./%", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_80_0")], [stringsetloc("* Kris..^1. before^1, I didn't think I could be a hero./", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_83_0"), stringsetloc("* I wasn't good enough. I mean^1, I was..^1. bad./", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_84_0"), stringsetloc("* I still kinda am bad. In some ways^1, I guess./%", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_85_0")], [stringsetloc("* But now^1, I..^1. I got hope crossed on my heart./", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_88_0"), stringsetloc("* Hope^1, written in truth. Written somewhere.../", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_89_0"), stringsetloc("* Written somewhere no one can erase!/%j", "obj_dw_churchb_rotatingtower_slash_Create_0_gml_90_0")]];
monologue_writer = -4;
monologuecon = -1;
monowatch = 0;
monotime = 0;
monocon = 0;
roomglow = instance_create(x, y, obj_roomglow);
stayactive = 0;
fakesu = 0;
sucon = 0;
sutime = 0;
endsu = -4;
suactorshadow = -4;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 3020)
        organiknpc = scr_makenpc_fromasset(spritesArray[i]);
}
organiknpc.chose = -1;

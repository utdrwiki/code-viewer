image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
kris = 0;
susie = 0;
ralsei = 0;
kr_real = 0;
su_real = 0;
ra_real = 0;
tenna = 0;
made = 0;
suwalk = 0;
suwalktimer = 0;
visit = 0;
pippins = instance_create(x, y, obj_board_pippins_grabbable);
with (pippins)
    setxy_board(3376, 352);
depth = 999995;
timer = 0;
drawtext = true;
texttimer = 0;
textcomplete = false;
shoptalk = 0;
sutalktimer = 0;
shopstring = "";
visitinit = 0;
sndpause = 0;
string1 = stringsetloc("GOOD DEALS GOOD#DEALS, HEH HEH.", "obj_b2westshop_slash_Create_0_gml_42_0");
string2 = stringsetloc("OOPS! GUESS I MADE#AN INNOCENT MISTAKE.", "obj_b2westshop_slash_Create_0_gml_43_0");
keystring = stringsetloc("KEY", "obj_b2westshop_slash_Create_0_gml_46_0");
freestring = stringsetloc("FREE", "obj_b2westshop_slash_Create_0_gml_47_0");
key = instance_create(x, y, obj_board_store_key);
with (key)
{
    setxy_board(3296, 448);
    cost = 100;
}
keycon = 0;
keytimer = 0;
noblock = 0;
candy = instance_create_board(8, 4.5, obj_board_tvdinner);
with (candy)
{
    setxy_board(3456, 448);
    type = 2;
    cost = 50;
}
forcedraw = false;
shopstring = string1;
drawitanyways = true;
pocketcheck = 0;
emptypocket = -1;

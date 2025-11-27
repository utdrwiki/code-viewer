var revroom = false;
layer_set_visible("debug_assets", 0);
global.flag[7] = 0;
var p = [];
var s = [];
var spritesArray = layer_get_all_elements("debug_assets");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 1278)
        p[0] = scr_assetgetinfo(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 5436)
        p[1] = scr_assetgetinfo(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 2301)
        p[2] = scr_assetgetinfo(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 4969)
        s[0] = scr_assetgetinfo(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 4232)
        s[1] = scr_assetgetinfo(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 2267)
        s[2] = scr_assetgetinfo(spritesArray[i]);
}
var shelfpos = [];
shelfpos[0] = [0, 0, 1120, 1120];
shelfpos[1] = [0, 0, 640, 720];
shelfpos[2] = [0, 0, 1200, 520];
if (array_length(s) > 0)
{
    revroom = true;
    shelfpos[0] = s[0];
    shelfpos[1] = s[1];
    shelfpos[2] = s[2];
}
shelf1 = instance_create(shelfpos[0][2], shelfpos[0][3], obj_bookshelf_moveable2x2);
piano1 = instance_create(p[0][2], p[0][3], obj_dw_church_remote_piano);
piano1.myshelf[0] = shelf1;
piano1.sprite_index = spr_dw_church_remotepiano_blue;
piano1.extflag = "bluepiano";
shelf1.sprite_index = spr_dw_church_2x2shelf_blue;
shelf1.xflag = 876;
shelf1.yflag = 877;
shelf2 = instance_create(shelfpos[1][2], shelfpos[1][3], obj_bookshelf_moveable2x2);
piano2 = instance_create(p[1][2], p[1][3], obj_dw_church_remote_piano);
piano2.myshelf[0] = shelf2;
piano2.sprite_index = spr_dw_church_remotepiano_red;
shelf2.sprite_index = spr_dw_church_2x2shelf_red;
shelf2.xflag = 878;
shelf2.yflag = 879;
piano2.extflag = "redpiano";
shelf3 = instance_create(shelfpos[2][2], shelfpos[2][3], obj_bookshelf_moveable2x2);
piano3 = instance_create(p[2][2], p[2][3], obj_dw_church_remote_piano);
piano3.myshelf[0] = shelf3;
piano3.sprite_index = spr_dw_church_remotepiano_green;
shelf3.sprite_index = spr_dw_church_2x2shelf_green;
shelf3.xflag = 880;
shelf3.yflag = 881;
piano3.extflag = "greenpiano";
if (array_length(s) > 0)
{
    with (obj_dw_church_remote_piano)
    {
        var myblock = instance_create(x + 12, y + 44, obj_solid_temp);
        myblock.extflag = "FLOOR2";
        scr_size(1.65, 0.6, myblock);
        var krmark = instance_create(x + 26, y + 20, obj_krmarker);
        krmark.extflag = extflag;
    }
}
scr_depth(piano1, 2000);
scr_depth(piano2, 2000);
scr_depth(piano3, 2000);
wasactive = 0;
shelvesinit = 0;
sprite_array_size = -1;
layersprite = [];
treasuremarker = instance_create(924, 872, obj_trigger_interact);
instance_create(x, y, obj_tutorial_text);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
        global.flag[876] = 0;
        global.flag[877] = 0;
        global.flag[878] = 0;
        global.flag[879] = 0;
        global.flag[880] = 0;
        global.flag[881] = 0;
        if (global.flag[710] >= 2)
            global.flag[710] = 0;
        else
            global.flag[710] = 2;
        var text = "Saw Ralsei's Room";
        if (global.flag[710] < 2)
            text = "Did not see Ralsei's Room";
        debug_print(text);
    }
}
telescope = -4;
telecon = 0;
drawspotlight = false;
teletimer = 0;
if (revroom)
{
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 783)
        {
            if (layer_sprite_get_blend(spritesArray[i]) == 16056319)
            {
                var trpos = scr_assetgetinfo(spritesArray[i]);
                setxy(trpos[2], trpos[3], treasuremarker);
            }
        }
        if (layer_sprite_get_sprite(spritesArray[i]) == 3352)
        {
            telescope = scr_makenpc_fromasset(spritesArray[i]);
            with (telescope)
            {
                issolid = false;
                marker.depth -= 10000;
            }
        }
    }
}
flooractive = 1;
init = 0;
tele_scon = 0;
tele_ssaw = false;
tele_stimer = 0;
tele_rcon = 0;
tele_rtimer = 0;
tele_rsaw = false;
s_remsprite = -4;
r_remsprite = -4;

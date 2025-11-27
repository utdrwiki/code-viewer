layer_set_visible("DEBUG_ASSETS", 0);
global.flag[7] = 0;
init = 0;
con = 0;
ccon = 0;
gcon = 0;
candy = 0;
subcon = 0;
con2 = 0;
early = 0;
fixsusie = false;
encounterno = 150;
encounterflag = 1782;
piano = instance_find(obj_church_piano_playable, 0);
upblock = instance_create(1320, 520, obj_solidblocksized);
with (upblock)
{
    visible = false;
    sprite_index = spr_pxwhite;
    scr_size(80, 80);
}
rightblock = -4;
makerightblock = true;
layer_set_visible("FAKE_TILES", true);
timer = 0;
gtimer = 0;
gerson = 0;
leavecon = 0;
cutscene_master = 0;
candymarker = scr_marker_ext(2080, 386, spr_church_candybowl, 2, 2, 0, undefined, undefined, undefined, 1);
forceside = -1;
darkinit = 0;
if (global.plot < 150)
    global.plot = 150;
if (scr_debug())
    scr_setparty(1, 1, 0);
visible = true;
clamper = 0;
if (global.plot == 150)
{
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("gerson_theme_intro.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    clamper = instance_create(1200, 800, obj_camera_clamper);
    clamper.xmin = 1040;
    clamper.ymin = 640;
    clamper.xmax = 1040;
    clamper.ymax = 640;
    scr_size(8, 8, clamper);
    gerson = instance_create(obj_mainchara.x - 18, 1036, obj_caterpillar_generic);
    gerson.sprite_index = spr_gerson_outfit_walk_cane;
    gerson.usprite = spr_gerson_outfit_walk_up;
    gerson.rsprite = spr_gerson_outfit_walk_cane_right;
    gerson.targetdist = 40;
    gerson.halign = 18;
    gerson.valign = 4;
    gerson.allowdown = false;
    gerson.downfavor = "right";
    gerson.depthyoff = 4;
    gerson.facing = 2;
    scr_size(2, 2, gerson);
    with (obj_border_controller)
        hide_border(0.025);
}
hidecater = 0;
sumark = 0;
ramark = 0;
germark = 0;
candyint = 0;
sucandyint = 0;
racandyint = 0;
takecount = 0;
depth = 0;
candytimer = 0;
gueimark = 0;
musicchange = 0;
gerint = 0;
layer_set_visible("WALLS_ALT", 0);
if (global.plot > 150)
{
    layer_set_visible("WALLS_ALT", 1);
    makerightblock = false;
    safe_delete(upblock);
    with (obj_floorswitch)
        instance_destroy();
    with (obj_church_piano_hint)
        instance_destroy();
    darkinit = 80;
    upblock = instance_create(1320, 520, obj_solidblocksized);
    with (upblock)
    {
        image_blend = c_black;
        depth = 999990;
        sprite_index = spr_pxwhite;
        scr_size(80, 280);
    }
    piano.solved = 1;
    con = 99999;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("church_wip.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    with (obj_church_triggerlight)
        instance_destroy();
}
fakegerblock = instance_create(562, 400, obj_solidblocksized);
fakegerblock.image_yscale = 2;
animsequence = 0;
cup = -4;
guei = -4;
cuptrig = -4;
gueitrig = -4;
if (global.plot > 150)
{
    var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 5127)
        {
            guei = scr_marker_fromasset(spritesArray[i], undefined, 1);
            guei.image_speed = 0.25;
            scr_depth(guei);
        }
        if (layer_sprite_get_sprite(spritesArray[i]) == 5585)
        {
            cup = scr_marker_fromasset(spritesArray[i], undefined, 1);
            cup.image_speed = 0.25;
            cup.con = 0;
            cup.timer = 0;
            with (cup)
                scr_limitval_upper(id, "y", ystart);
            scr_depth(cup, 10);
        }
        if (layer_sprite_get_sprite(spritesArray[i]) == 1779)
        {
            cuptrig = scr_makenpc_fromasset(spritesArray[i], undefined, 1);
            cuptrig.marker.visible = false;
        }
        if (layer_sprite_get_sprite(spritesArray[i]) == 5276)
        {
            gueitrig = scr_makenpc_fromasset(spritesArray[i], undefined, 1);
            gueitrig.marker.visible = false;
            gueitrig.timer = 0;
        }
    }
}
trippin = 0;
canetimer = 0;
caught = -4;

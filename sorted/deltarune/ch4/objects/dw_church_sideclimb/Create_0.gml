siner = 0;
global.flag[7] = 0;
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("1")))
    {
        global.flag[1524] = 0;
        global.flag[1525] = 0;
        global.flag[1526] = 0;
    }
    if (keyboard_check(ord("2")))
    {
        global.flag[1524] = 999;
        global.flag[1525] = 0;
        global.flag[1526] = 0;
    }
    if (keyboard_check(ord("3")))
    {
        var loc = findspriteinfo(spr_krisd_heart, "DEBUG_ASSETS");
        setxy(loc.x, loc.y, 1049);
        with (obj_caterpillarchara)
            setxy(loc.x, loc.y);
        scr_caterpillar_interpolate("all");
        global.flag[1524] = 999;
        global.flag[1525] = 999;
        global.flag[1526] = 0;
    }
}
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("MIZZLE_SLIDE", false);
layer_set_visible("MIZZLE_SLIDE_BG", false);
mizzle = -4;
npc1 = -4;
npc2 = -4;
npc3 = -4;
_trophy = -4;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 5585)
    {
        if (layer_sprite_get_blend(spritesArray[i]) == 65535)
        {
            npc1 = scr_makenpc_fromasset(spritesArray[i]);
            npc1.issolid = false;
            npc1.marker.image_blend = c_white;
        }
        if (layer_sprite_get_blend(spritesArray[i]) == 16740607)
        {
            npc2 = scr_makenpc_fromasset(spritesArray[i]);
            npc2.issolid = false;
            npc2.marker.image_blend = c_white;
        }
        if (layer_sprite_get_blend(spritesArray[i]) == 14482175)
        {
            npc3 = scr_makenpc_fromasset(spritesArray[i]);
            npc3.issolid = false;
            npc3.marker.image_blend = c_white;
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1056)
    {
        mizzle = scr_marker_fromasset(spritesArray[i], undefined, 1);
        mizzle.image_speed = 0.25;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 2496)
    {
        _trophy = scr_makenpc_fromasset(spritesArray[i], undefined, 1);
        _trophy.issolid = false;
    }
}
con = 0;
timer = 0;
siner = 0;
timber = 0;
gentimer = 0;
defender1 = 0;
var ws1 = findspriteinfo(spr_dw_church_climb_wallswitch, "DEBUG_ASSETS", c_red);
var ws2 = findspriteinfo(spr_dw_church_climb_wallswitch, "DEBUG_ASSETS", c_blue);
wallswitch[0] = scr_marker_ext(ws1.x, ws1.y, spr_dw_church_climb_wallswitch, 2, 2, 0, undefined, undefined, 99990);
wallswitch[1] = scr_marker_ext(ws2.x, ws2.y, spr_dw_church_climb_wallswitch, 2, 2, 0, undefined, undefined, 99990);
triginit = 0;
forcefall = 0;
tickcount = 0;
canceltimer = 0;
defendercon = 0;
if (global.flag[1526] == 1)
    defendercon = 5;
if (global.flag[1526] > 1)
{
    defendercon = 14;
    safe_delete(mizzle);
}
layer_set_visible("TILES_POSTMIZZLE", 0);
topblock = instance_create(2120, 320, obj_solidblocksized);
scr_size(2, 4, topblock);
slideblock = instance_create(1400, 520, obj_solidblocksized);
scr_size(1, 20, slideblock);
if (global.flag[1526] < 2)
    setxy(room_width, room_height, npc3);
init = 0;
stufftomove[0] = 601;
array_push(stufftomove, 202);
r1leavetopentrance = 0;
r1leavebottomentrance = 0;
r2leavetopentrance = 0;
r2leavebottomentrance = 0;
layer_set_visible("TILES_CLIMBSHORT1", 0);
layer_set_visible("TILES_CLIMBSHORT2", 0);
if (global.flag[1524] != 0)
    event_user(1);
if (global.flag[1525] != 0)
    event_user(2);
if (global.flag[1526] == 3)
    event_user(4);
camx = 0;
camy = 0;
camcontrol = 0;
failsafetime = 0;
music = "climb.ogg";
scr_musicer(music);

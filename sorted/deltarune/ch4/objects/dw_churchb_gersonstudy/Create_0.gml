timer = 0;
con = 0;
global.flag[7] = 0;
blueflame = -4;
gersonrebattle = global.tempflag[99];
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("BACKGROUND_GIVEDEPTH_TEMP", 0);
layer_set_visible("BACKGROUND_GIVEDEPTH", 0);
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
shop = -4;
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 1645)
    {
        shop = scr_makenpc_fromasset(spritesArray[i]);
        shop.didgetitem = -1;
        shop.issolid = false;
        scr_sizeexact(40, 60, shop);
    }
}
scr_depth(shop.marker, 100);
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
    if (keyboard_check(ord("1")))
        global.plot = 239;
    if (keyboard_check(ord("2")))
        global.tempflag[90] = 0.5;
    if (keyboard_check(ord("3")))
        global.tempflag[99] = !global.tempflag[99];
    if (global.tempflag[90] == 0.5)
        global.plot = 239.1;
}
if (!snd_is_playing(global.currentsong[1]))
{
    scr_musicer("gerson_defeated.ogg", 0.7, 0.75);
    snd_volume(global.currentsong[1], 0.7, 0);
}
else
{
    snd_volume(global.currentsong[1], 0.7, 0);
    audio_sound_pitch(global.currentsong[1], 1);
}
snd_pitch(global.currentsong[1], 0.75);
scr_setparty(1);
excl = 0;
blackout = 0;
if (global.plot <= 239)
{
    blackout = scr_marker_ext(320, 696, spr_pxwhite, 640, 480, undefined, undefined, c_black, 500);
    var lifetime = 60;
    with (blackout)
        scr_lerpvar("image_alpha", 1.2, 0, lifetime);
    scr_doom(blackout, lifetime);
    con = 1;
}
if (global.plot == 239.1)
    con = 4;
if (global.plot > 239.2)
    con = -1;
depthinit = 0;

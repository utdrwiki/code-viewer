global.flag[7] = 0;
init = 0;
timer = 0;
con = 0;
germark1 = 0;
darkcount = 0;
darkindex = 0;
blackout = 0;
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("DEBUG_BGCOLOR", 0);
layer_set_visible("TILES", 0);
ripplemanager = instance_create(x, y, obj_church_ripple_area_manager);
ripplemanager.alwaysrip = true;
quizindex = 0;
qcon = 0;
qtimer = 0;
qx = 0;
qy = 0;
qplay = 0;
correctscore = 0;
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("P")))
        global.tempflag[90] = 43;
    if (keyboard_check(ord("O")))
    {
        setxy(room_width / 2, room_height / 2, 1049);
        qcon = 41;
        global.interact = 1;
        con = -1;
        timer = 0;
        darkcount = 6;
        layer_set_visible("TILES_WALL", 0);
    }
}
var availablesnds = [80, 164];
correctsnd1 = availablesnds[irandom(array_length(availablesnds) - 1)];
for (var i = 0; i < array_length(availablesnds); i++)
{
    if (availablesnds[i] == correctsnd1)
        array_delete(availablesnds, i, 1);
}
correctsnd2 = availablesnds[irandom(array_length(availablesnds) - 1)];
correctdir1 = choose(0, 1);
correctdir2 = !correctdir1;
if (correctdir1 == 1)
{
    var copystring = audio_get_name(correctsnd1);
    copystring = string_copy(copystring, 0, string_length(copystring) - 2) + "_r";
    correctsnd1 = asset_get_index(copystring);
}
if (correctdir2 == 1)
{
    var copystring = audio_get_name(correctsnd2);
    copystring = string_copy(copystring, 0, string_length(copystring) - 2) + "_r";
    correctsnd2 = asset_get_index(copystring);
}
if (scr_debug())
{
    if (!snd_is_playing(global.currentsong[1]) && !keyboard_check(ord("P")))
    {
        pitch = 0.54;
        scr_musicer("gerson_defeated.ogg", 0.6, 0.54);
    }
}
pitch = audio_sound_get_pitch(global.currentsong[1]);
if (pitch < 0.5)
    pitch = 0.54;
startpitch = pitch;
beginx = obj_mainchara.x;
beginy = obj_mainchara.y;
var loc = findspriteinfo(spr_debug_arrow10, "DEBUG_ASSETS", #0022FF);
endx = loc.x;
endy = loc.y;

var cx = camerax();
var cy = cameray();
var left = blackloc[0];
var right = blackloc[1];
if (cx > 0 && global.interact == 0)
{
    var newblackprog = clamp(1 - ((cx - 480) / (right - left)), 0.125, 1.1);
    blackprog = max(blackprog, newblackprog);
}
newpitch = lerp(0.75, 0.5, blackprog);
pitch = lerp(pitch, newpitch, 0.02);
audio_sound_pitch(global.currentsong[1], pitch);
blackoverlay.image_alpha = blackprog;
var headstart = 0.2;
var amt = clamp(blackprog + headstart, 0, 1);
kris.image_blend = merge_color(c_white, c_black, amt);
susie.image_blend = merge_color(c_white, c_black, amt);
var border_alpha = blackprog;
with (obj_border_controller)
{
    custom_effect_alpha = border_alpha;
    custom_effect_alpha_target = border_alpha;
}
if (blackprog >= 0.99)
{
    with (obj_border_controller)
    {
        stop_custom_effect();
        hide_border();
    }
    global.tempflag[51] = obj_mainchara.y - cameray();
    show_debug_message_concat(camerax(), " / ", cameray(), "LOC:", global.tempflag[51]);
    room_goto(room_dw_churchb_gersonchase);
}

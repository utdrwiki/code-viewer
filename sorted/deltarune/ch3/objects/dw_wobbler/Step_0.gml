if (wobbled)
    exit;
if (!i_ex(obj_mainchara))
    exit;
var _on_screen = rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0]);
if (!_on_screen)
    exit;
if (is_vertical)
{
    var play_sound = obj_mainchara.sliding != 1;
    if (room == room_dw_couch_overworld_01)
        play_sound = true;
    if (obj_mainchara.y > (y - 10) && obj_mainchara.y < (y + 50))
    {
        if (play_sound)
        {
            s = snd_play(snd_wobbler);
            snd_pitch(s, 0.8 + random(0.3));
        }
        image_speed = 0.2;
        wobbled = true;
    }
}
else if (obj_mainchara.x > (x - 10) && obj_mainchara.x < (x + 50))
{
    s = snd_play(snd_wobbler);
    snd_pitch(s, 0.8 + random(0.3));
    image_speed = 0.2;
    wobbled = true;
}

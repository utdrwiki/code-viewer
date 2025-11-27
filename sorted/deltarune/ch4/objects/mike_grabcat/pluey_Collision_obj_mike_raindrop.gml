if (!(action == 1 || action == 5))
    exit;
if (other.harmless)
    exit;
with (other)
    instance_destroy();
action = 5;
snd_play_pitch(snd_meow, 1.4);
var s = snd_play_volume(snd_wetstep, 0.8);
snd_pitch(s, 1.1);
with (obj_mike_controller)
{
    if (hand_target != -4 && i_ex(hand_target) && hand_target.id == other.id)
    {
        hand_type = 0;
        hand_target = -4;
    }
}
hspeed = -12;
vspeed = -6;
sprite_index = spr_mike_cat_attack;
image_xscale = -1;
image_speed = 0;
is_launched = false;
with (scr_marker(x, y, spr_mike_raindrop_hit))
{
    image_xscale = 2;
    image_yscale = 2;
    image_speed = 0.5;
    scr_doom(self, 7);
}

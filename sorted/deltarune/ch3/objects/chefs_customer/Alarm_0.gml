if (leaving)
    exit;
var _score = foodscore;
if (special)
    _score = 40 + round(foodscore * 1.25);
if (foods_needed > 0)
{
    eating = 0;
    leaving = 0;
    exit;
}
var _text = instance_create_depth(x, y, depth - 10, obj_chefs_scoretxt);
_text.blurb = "+" + string(_score);
if (special)
{
    _text.blurb = stringsetloc("BONUS", "obj_chefs_customer_slash_Alarm_0_gml_20_0") + " " + _text.blurb;
    _text.alarm[0] += 10;
}
repeat (floor(_score))
{
    with (instance_create((x - 30) + irandom(60), y + irandom(24), obj_chefs_coinvfx))
    {
        sprite_index = choose(spr_chefs_coin, spr_chefs_coin2, spr_chefs_coin3);
        image_index = irandom(3);
        vspeed = choose(-4, -6, -3, -5);
        alarm[0] = min(20 + irandom(10), 10 + irandom(_score / 2));
        gravity = 0.2;
        gravity_direction = 270;
    }
}
leaving = true;
hspeed = 0;
vspeed = 10;
sprite_index = sprLeave;
if (special)
    snd_play_pitch(snd_bigscore, 1.3);
else
    snd_play_pitch(snd_egg, 1.9);

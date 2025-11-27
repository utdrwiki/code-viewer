siner++;
if (con == 1)
{
    var pitch = 1.4;
    if (value > 5)
        pitch = 1.15;
    snd_play(snd_coin, 0.7, pitch);
    if (value > 5)
        snd_play_delay(snd_coin, 2, 0.4, pitch * 0.75);
    global.gold += value;
    snd = 271;
    var delaytime = 6;
    var decay = 0.2;
    var vol = 1;
    snd_play(snd, vol, 1.5);
    var count = 1;
    snd_play_delay(snd, 1 + (delaytime * count) + 1, vol - (count * 0.2), 1.5 - (decay * count));
    count++;
    snd_play_delay(snd, 1 + (delaytime * count) + 3, vol - (count * 0.2), 1.5 - (decay * count));
    count++;
    snd_play_delay(snd, 1 + (delaytime * count) + 5, vol - (count * 0.2), 1.5 - (decay * count));
    count++;
    var thedepth = 0;
    with (obj_climb_kris)
        thedepth = depth - 1;
    with (instance_create_depth(x + 20, y + 20, thedepth, obj_textmarker))
    {
        if (obj_climb_kris.onrotatingtower)
            x = obj_rotating_tower_controller_new.tower_x;
        font = global.damagefontgold;
        mystring = "+" + string(other.value) + "$";
        vspeed = -4;
        friction = 0.25;
        outline = false;
        scr_doom(id, 30);
    }
    scr_lerpvar("image_alpha", image_alpha, 0, 40, 2, "out");
    scr_lerpvar("bowlindex", 0, 15, 40, 2, "out");
    con = 2;
}
if (!dodraw)
    exit;
draw_set_alpha(image_alpha);
var _count = 32;
var light = 16777215;
var dark = 13212566;
var mycol = merge_color(c_white, c_gray, bowlindex / 15);
var mysprite = 5739;
if (value > 5)
    mysprite = 5011;
var sinamt = sin(siner / 20) * 6 * clamp(1 - (bowlindex / 7), 0, 1);
draw_sprite_ext(spr_dw_church_coinbowl, bowlindex, x, y - sinamt, 2, 2, 0, mycol, 1);
if (con == 0)
    draw_sprite_ext(mysprite, siner / 4, x + 20, y + 20 + (sin(siner / 20) * 4), 2, 2, 0, c_white, 1);
draw_set_alpha(1);

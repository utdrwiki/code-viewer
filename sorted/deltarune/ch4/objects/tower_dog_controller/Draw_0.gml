var cx = camerax();
var cy = cameray();
var dogyoffset = 0;
if (letterboxcon == 1)
{
    letterboxtimer++;
    if (letterboxtimer == 1)
        snd_play_pitch(snd_wallclaw, 0.8);
    if (letterboxtimer > 0 && letterboxtimer <= 15)
    {
        letterboxalpha = 1;
        y2 = lerp(y2, 220, 0.2);
        y6 = lerp(y6, 230, 0.2);
    }
    if (letterboxtimer == 30)
        snd_play(snd_dogrev);
    if (letterboxtimer == 69)
        snd_play(snd_dograce_countdown);
    if (letterboxtimer == 70)
    {
        scr_lerpvar("y2", y2, y2 + 3, 4, 3, "in");
        scr_lerpvar("y6", y6, y6 - 3, 4, 3, "in");
    }
    if (letterboxtimer == 93)
    {
        scr_lerpvar("y2", y2, y2 + 3, 4, 3, "in");
        scr_lerpvar("y6", y6, y6 - 3, 4, 3, "in");
    }
    if (letterboxtimer == 122)
    {
        scr_lerpvar("y2", y2, 0, 7, 3, "in");
        scr_lerpvar("y6", y6, 480, 7, 3, "in");
    }
    if (!variable_instance_exists(dog, "anchory"))
    {
        dog.anchorx = dog.x;
        dog.anchory = dog.y;
    }
    if (letterboxtimer >= 125)
    {
        letterboxalpha -= 0.2;
        battlebgalpha = 0;
    }
    dog.x = dog.anchorx + (floor(sin((letterboxtimer * letterboxtimer) / 100)) * 2);
    dog.y = dog.anchory + (floor(cos((letterboxtimer * letterboxtimer) / 200)) * 2);
    if (letterboxtimer > 30 && (letterboxtimer % (14 - min(13, floor(0.2 * letterboxtimer)))) == 0)
    {
        with (instance_create(dog.x + random_range(-10, 10) + 4, dog.y + 6, obj_animation))
        {
            sprite_index = spr_rabbick_dustorb;
            image_speed = 0.5;
            image_blend = c_ltgray;
            depth = other.dog.depth - 0.2;
            hspeed = 1;
            vspeed = random_range(-3, -4);
        }
    }
    if (letterboxtimer == 150)
    {
        letterboxcon = 2;
        letterboxtimer = 0;
    }
}
draw_set_alpha(bgalpha);
ossafe_fill_rectangle(0, 0, 640, 480, false);
draw_sprite_ext(spr_nothing, battlebgindex, 0, 180, 2, 2.9, 0, c_white, battlebgalpha);
draw_sprite_ext(spr_nothing, battlebgindex, 272, 180, 2, 2.9, 0, c_white, battlebgalpha);
draw_sprite_ext(spr_nothing, battlebgindex, 544, 180, 2, 2.9, 0, c_white, battlebgalpha);
battlebgindex += 0.5;
draw_set_color(c_black);
draw_set_alpha(letterboxalpha);
ossafe_fill_rectangle(cx, cy, cx + 640, cy + y2, false);
ossafe_fill_rectangle(cx, cy + 480, cx + 640, cy + y6, false);
draw_set_alpha(linealpha);
d_line_width_color(linex1, 240, linex2, 240, linewidth, 16777215, 16777215);
draw_set_alpha(1);
if (con == 6)
{
    var _angledifference = -angle_difference(obj_rotating_tower_controller_new.tower_angle, 315);
    var xx = 0;
    if (_angledifference >= 0 && _angledifference <= 90)
        xx = lerp(0, 66, _angledifference / 90);
    else if (_angledifference >= -90 && _angledifference < 0)
        xx = lerp(0, -66, abs(_angledifference) / 90);
    else
        xx = -1000;
    var _index = 5 + floor((xx - 10) / 22);
    if (abs(_angledifference) > 90)
        _index = 10;
    var draw_x = 560 + xx;
    with (obj_tower_dog_ladder_fake)
    {
        image_xscale = 1 - (abs(_index - 4) / 5);
        x = draw_x;
        depth = obj_rotating_tower_controller_new.depth - sin(degtorad(_angledifference));
        if (falling)
        {
            falling += 0.2;
            y = (y + falling) - 1;
        }
    }
    with (obj_tower_dog_fx1)
        image_index = 4 - ((floor(_angledifference * 0.2) + 4) % 5);
}

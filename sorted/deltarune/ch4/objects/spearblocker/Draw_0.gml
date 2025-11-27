if (frozentimer > 0)
{
    frozentimer--;
    exit;
}
image_angle_prev = image_angle;
if (just > 0)
    just--;
if (shadowpowercon == 1)
{
    shadowpowertimer++;
    shadowpower = lerp(shadowpowerstart, shadowpowertarget, shadowpowertimer / shadowpowertimermax);
    if (shadowpowertimer >= shadowpowertimermax)
    {
        if (shadowpower == 0.85)
            shadowpower = 1;
        shadowpowerstart = shadowpowertarget;
        shadowpowertimer = 0;
        shadowpowercon = 0;
    }
}
if (down_p())
{
    if (idealdir == 270 || idealdir == 225 || idealdir == 315)
        bumpaxecon = 1;
    idealdir = 270;
    just = justlength;
    if (left_p() || right_p())
        just = justlength + 2;
}
if (up_p())
{
    if (idealdir == 90 || idealdir == 45 || idealdir == 135)
        bumpaxecon = 1;
    idealdir = 90;
    just = justlength;
    if (left_p() || right_p())
        just = justlength + 2;
}
if (left_p())
{
    if (idealdir == 180 || idealdir == 135 || idealdir == 225)
        bumpaxecon = 1;
    idealdir = 180;
    just = justlength;
    if (up_p() || down_p())
        just = justlength + 2;
}
if (right_p())
{
    if (idealdir == 0 || idealdir == 45 || idealdir == 315)
        bumpaxecon = 1;
    idealdir = 0;
    just = justlength;
    if (up_p() || down_p())
        just = justlength + 2;
}
if (diagonal_transform == 1 && !i_ex(obj_sound_of_justice_enemy))
{
    diagonal_enabled = 1;
    if (image_yscale == 1 && !audio_is_playing(snd_jump) && obj_hammer_of_justice_enemy.transformsfx == 0)
        snd_play(snd_jump);
    image_yscale = lerp(image_yscale, 0.6, 0.2);
    if (image_yscale < 0.62)
    {
        image_yscale = 0.6;
        diagonal_transform = 0;
    }
    if (radius == 30 && obj_hammer_of_justice_enemy.transformsfx == 0)
    {
        obj_hammer_of_justice_enemy.transformsfx = 1;
        snd_play(snd_jump);
        transformflashtimer = 70;
    }
    radius = lerp(radius, 35, 0.2);
    origin_offset = lerp(origin_offset, 5, 0.2);
    sprite_set_offset(spr_spearblocker, 32 - origin_offset, 32);
    if (radius > 34)
    {
        radius = 35;
        sprite_set_offset(spr_spearblocker, 27, 32);
        diagonal_transform = 0;
    }
}
if (up_h())
    idealdir = 90;
if (right_h())
    idealdir = 0;
if (left_h())
    idealdir = 180;
if (down_h())
    idealdir = 270;
if (!i_ex(obj_sound_of_justice_enemy) && diagonal_enabled == 1)
{
    if (up_h() && right_h())
        idealdir = 45;
    if (left_h() && up_h())
        idealdir = 135;
    if (down_h() && left_h())
        idealdir = 225;
    if (right_h() && down_h())
        idealdir = 315;
}
if (idealdir != idealdirprevious)
{
    just = justlength;
    bumpaxecon = 1;
}
idealdirprevious = idealdir;
if (bumpaxecon == 1)
{
    if (diagonal_enabled == 0)
        sprite_set_offset(spr_spearblocker, 30, 32);
    if (diagonal_enabled == 1)
        sprite_set_offset(spr_spearblocker, 25, 32);
    bumpaxecon = 2;
    var wingsound = snd_play(snd_wing);
    snd_volume(wingsound, 0.8, 0);
}
else if (bumpaxecon == 2)
{
    if (diagonal_enabled == 0)
        sprite_set_offset(spr_spearblocker, 31, 32);
    if (diagonal_enabled == 1)
        sprite_set_offset(spr_spearblocker, 26, 32);
    bumpaxecon = 3;
}
else if (bumpaxecon == 3)
{
    if (diagonal_enabled == 0)
        sprite_set_offset(spr_spearblocker, 32, 32);
    if (diagonal_enabled == 1)
        sprite_set_offset(spr_spearblocker, 27, 32);
    bumpaxecon = 0;
}
if (i_ex(obj_heart))
{
    x = obj_heart.x + 10;
    y = obj_heart.y + 10;
}
if (!i_ex(obj_heart) || global.turntimer < 1)
    instance_destroy();
var rep = 1;
rep = ceil(abs(angle_difference(idealdir, image_angle) * 0.666));
var _dontmove = false;
for (var i = 0; i < instance_number(obj_spearshot); i += 1)
{
    spear[i] = instance_find(obj_spearshot, i);
    if (spear[i].bouncespearcon == 1 && spear[i].bouncespeartimer < 3)
        _dontmove = true;
}
if (!_dontmove)
{
    repeat (rep)
    {
        var _dir = image_angle - idealdir;
        var _angledifference = _dir;
        if (abs(_dir) > 180)
        {
            if (image_angle > idealdir)
                _angledifference = -1 * ((360 - image_angle) + idealdir);
            else
                _angledifference = (360 - idealdir) + image_angle;
        }
        if (image_angle == idealdir)
        {
        }
        else if (_angledifference > 2)
        {
            image_angle -= 1;
        }
        else if (_angledifference < 2)
        {
            image_angle += 1;
        }
        else
        {
            image_angle = idealdir;
        }
        if (image_angle > 360)
            image_angle -= 360;
        if (image_angle < 0)
            image_angle += 360;
    }
}
if (i_ex(obj_spearshot))
{
    var closest_spear_dist = 9999;
    var closest_spear_id = -1;
    for (var i = 0; i < instance_number(obj_spearshot); i++)
    {
        sper = instance_find(obj_spearshot, i);
        if (sper.bouncespear == 0)
            sper.sprite_index = spr_spear_arrow;
        if (sper.longspear == 1)
            sper.sprite_index = spr_spear_arrow_long;
        if ((sper.len / sper.fakespeed) < closest_spear_dist)
        {
            closest_spear_id = sper;
            closest_spear_dist = sper.len / sper.fakespeed;
        }
    }
    if (closest_spear_id != -1 && i_ex(closest_spear_id) && closest_spear_id.fadespear != 3 && closest_spear_id.bouncespear == 0 && closest_spear_id.longspear == 0)
        closest_spear_id.sprite_index = spr_spear_arrow_highlight;
}
if (vanish == 1)
{
    image_alpha -= 0.1;
    if (image_alpha < 0)
        instance_destroy();
}
else if (image_alpha < 1)
{
    image_alpha += 0.2;
}
draw_set_alpha(image_alpha);
var shakex = 0;
var shakey = 0;
if (shake > 0)
{
    shake--;
    shakex = -10 + random(20);
    shakey = -10 + random(20);
}
shakex += 1;
shakey += 1;
if (flash < 2)
{
    image_index = 0;
}
else
{
    image_index = 1;
    flash--;
}
draw_set_color(c_green);
event_user(2);
draw_sprite_ext(spr_spearblocker, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_color(c_white);
if (i_ex(obj_sound_of_justice_enemy))
{
    var shadowalpha = lerp(1, 0, shadowpower / 1);
    if (vanish == 1)
        shadowalpha = image_alpha;
    d3d_set_fog(true, dark_brown, 0, 1);
    draw_sprite_ext(spr_spearblocker, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, shadowalpha);
    d3d_set_fog(false, c_black, 0, 0);
    draw_set_alpha(0);
}
if (parryflashtimer > 0)
{
    parryflashtimer--;
    var parryalpha = scr_wrap(parryflashtimer / 2, 0, 1);
    draw_set_alpha(parryalpha);
    d3d_set_fog(true, c_white, 0, 1);
    event_user(2);
    d3d_set_fog(false, c_black, 0, 0);
    draw_set_alpha(0);
}
if (justflash > 0)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(spr_spearblocker, 2, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, c_white, justflash);
    d3d_set_fog(false, c_black, 0, 0);
    justflash -= 0.5;
}
draw_set_alpha(1);
if (fadealpha > 0)
{
    d3d_set_fog(true, c_white, 0, 1);
    d_circle(x + shakex, y + shakey, radius, 1);
    draw_sprite_ext(spr_spearblocker, 2, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, c_white, fadealpha);
    d3d_set_fog(false, c_black, 0, 0);
    fadealpha -= 0.05;
}

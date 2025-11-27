if (!i_ex(obj_heart))
{
    instance_destroy();
    exit;
}
var shakelen = 0;
var shakedir = 0;
if (shakeduration > 0)
{
    shakeduration--;
    if (shakeduration == 2)
        shakelen = -4;
    if (shakeduration == 4)
        shakelen = 4;
    if (shakeduration == 0)
        shakelen = 0;
    shakedir = direction + 90;
}
if (longspear == 1)
    image_index = longnotebeingheld;
if (fadespear == 3 || fadespear == 4)
    image_angle = point_direction(x, y, obj_spearblocker.x, obj_spearblocker.y);
if (redhammer == 1)
{
    redhammersiner++;
    var _color = merge_color(c_white, c_red, 0.4 + (sin(redhammersiner / 8) / 3));
    var shakex = 0;
    if (redhammerfakeout == 1)
    {
        redhammersiner++;
        if (redhammersiner == 350)
            fakespeed = 0;
        if (redhammersiner == 410)
        {
            fakespeed = -15;
            grav = 3;
        }
        if (redhammersiner > 420)
        {
            afterimage = scr_afterimage();
            afterimage.sprite_index = spr_gerson_red_hammer;
            afterimage.image_blend = _color;
            afterimage.image_xscale = 2;
            afterimage.image_yscale = 2;
            afterimage.fadeSpeed = 0.15;
        }
        if (redhammersiner > 200 && redhammersiner < 410)
            shakex = random(4);
        if ((redhammersiner % 2) == 0)
            redhammersign = -1;
        else
            redhammersign = 1;
    }
    draw_sprite_ext(spr_gerson_red_hammer, 3, x + (shakex * redhammersign) + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), 2, 2, image_angle, _color, image_alpha);
}
else if (bouncespear > 0)
{
    var shellcolor = 16777215;
    if (hp == 8)
        shellcolor = pink3;
    if (hp == 7)
        shellcolor = pink2;
    if (hp == 6)
        shellcolor = pink1;
    if (hp == 5)
        shellcolor = 255;
    if (hp == 4)
        shellcolor = 8388736;
    if (hp == 3)
        shellcolor = 16776960;
    if (hp == 2)
        shellcolor = 65280;
    if (hp == 1)
        shellcolor = 65535;
    var scale = 0.75;
    if (gigashell == true)
        scale = 1;
    var angle = point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10);
    if (bouncespearcon == -1)
        spinindex += 0.5;
    if (bouncespear == 1)
        spinindex = 0;
    if (len < -20)
    {
    }
    else
    {
        if (sprite_index == spr_bounce_shell_idle)
            draw_sprite_ext(spr_bounce_shell_idle_color, spinindex, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, angle, shellcolor, image_alpha);
        if (sprite_index == spr_bounce_shell_hit_center)
            draw_sprite_ext(spr_bounce_shell_hit_center_color, spinindex, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, angle, shellcolor, image_alpha);
        if (sprite_index == spr_bounce_shell_squish)
            draw_sprite_ext(spr_bounce_shell_squish_color, spinindex, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, angle, shellcolor, image_alpha);
        if (sprite_index == spr_bounce_shell_squish2)
            draw_sprite_ext(spr_bounce_shell_squish2_color, spinindex, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, angle, shellcolor, image_alpha);
        draw_sprite_ext(sprite_index, spinindex, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, angle, image_blend, image_alpha);
    }
    if (bouncespear == 2)
    {
    }
}
else
{
    draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (flashalpha > 0)
{
    flashalpha -= 0.1;
    var scale = lerp(2, 0, flashalpha);
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + scale, image_yscale + scale, image_angle, c_white, flashalpha);
    d3d_set_fog(false, c_white, 0, 0);
}
if (longspear == 1)
{
    var a = 0;
    repeat (longnotepieces)
        a++;
    draw_sprite_ext(spr_spear_arrow_long_piece, longnotebeingheld, x + lengthdir_x(1, image_angle + 180), y + lengthdir_y(1, image_angle + 180), image_xscale * longnotepieces, image_yscale, image_angle, image_blend, image_alpha);
    var barlength = (longnotepieces * 2) - 2;
    if (longnotebeingheld == true)
    {
        if ((longnotepieces % 1) == 0)
        {
            repeat (3)
            {
                inst = instance_create(x + lengthdir_x(barlength - random(abs(fakespeed)), image_angle + 180) + lengthdir_x(3, image_angle + 180 + 90), (y - 3) + lengthdir_y(barlength, image_angle + 180) + lengthdir_y(3, image_angle + 180 + 90), obj_arrow_long_particle);
                inst.image_index = 3;
                inst = instance_create(x + lengthdir_x(barlength - random(abs(fakespeed)), image_angle + 180) + lengthdir_x(2, image_angle + 180 + 90), (y - 2) + lengthdir_y(barlength, image_angle + 180) + lengthdir_y(2, image_angle + 180 + 90), obj_arrow_long_particle);
                inst.image_index = 3;
                inst = instance_create(x + lengthdir_x(barlength - random(abs(fakespeed)), image_angle + 180) + lengthdir_x(1, image_angle + 180 + 90), (y - 1) + lengthdir_y(barlength, image_angle + 180) + lengthdir_y(1, image_angle + 180 + 90), obj_arrow_long_particle);
                inst.image_index = 3;
                inst = instance_create(x + lengthdir_x(barlength - random(abs(fakespeed)), image_angle + 180) + lengthdir_x(-1, image_angle + 180 + 90), (y - 1) + lengthdir_y(barlength, image_angle + 180) + lengthdir_y(-1, image_angle + 180 + 90), obj_arrow_long_particle);
                inst.image_index = 3;
                inst = instance_create(x + lengthdir_x(barlength - random(abs(fakespeed)), image_angle + 180) + lengthdir_x(-2, image_angle + 180 + 90), (y - 2) + lengthdir_y(barlength, image_angle + 180) + lengthdir_y(-2, image_angle + 180 + 90), obj_arrow_long_particle);
                inst.image_index = 3;
            }
        }
        with (obj_arrow_long_particle)
            direction = ((other.image_angle + 180) - 45) + irandom(90);
        longnoteindex++;
        if (longnoteindex == 1)
            damage = round(damage / 2);
        var scale = 1.5;
        if (choose(0, 1) == 1)
            draw_sprite_ext(spr_sparks2, longnoteindex, x + lengthdir_x(1, image_angle + 180), y + lengthdir_y(1, image_angle + 180), scale, scale, image_angle, image_blend, image_alpha);
        else
            draw_sprite_ext(spr_sparks2, longnoteindex + 2, x + lengthdir_x(1, image_angle + 180), y + lengthdir_y(1, image_angle + 180), scale, -1 * scale, image_angle, image_blend, image_alpha);
        snd_stop(snd_organ_enemy_loop_temp);
        pitchcount--;
        var _pitch = 2 - (pitchcount / 60);
        if (_pitch < 0.5)
            _pitch = 0.5;
        snd_play_pitch(snd_organ_enemy_loop_temp, _pitch);
        longnotepieces -= ceil(fakespeed / 2);
        if (longnotepieces < 0)
        {
            inst = instance_create_depth(x, y, depth - 1000, obj_animation);
            inst.sprite_index = spr_finisher_explosion_quick;
            inst.image_speed = 1;
            inst.image_angle = image_angle;
            inst.image_xscale = 0.2;
            inst.image_yscale = 0.2;
            snd_play_x(snd_queen_punched_lower_heavy, 0.5, 2);
            instance_destroy();
        }
    }
}

if (i_ex(obj_gerson_green_switch))
    exit;
if (state == 0)
    movesiner += (1/3);
if (state == 14)
{
    if (state14con == 0)
    {
        state14timer++;
        draw_sprite_ext(spr_statue_sound_of_justice, 0, x - 10, y - 50, 2, 2, 0, c_white, 1);
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_statue_sound_of_justice, 0, x - 10, y - 50, 2, 2, 0, c_white, (10 - state14timer) / 10);
        d3d_set_fog(false, c_black, 0, 0);
        if (state14timer == 10)
        {
            state14timer = 0;
            state14con = 1;
        }
    }
    if (state14con == 1)
    {
        state14timer++;
        draw_sprite_ext(spr_statue_sound_of_justice, 0, x - 10, y - 50, 2, 2, 0, c_white, 1);
        if (state14timer == 60)
        {
            state14timer = 0;
            state14con = 2;
            state = 0;
        }
    }
    if (state14con == 2)
    {
        state14timer++;
        draw_sprite_ext(spr_statue_sound_of_justice, 0, x - 10, y - 50, 2, 2, 0, c_white, 1);
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_statue_sound_of_justice, 0, x - 10, y - 50, 2, 2, 0, c_white, state14timer / 10);
        d3d_set_fog(false, c_black, 0, 0);
        if (state14timer == 10)
        {
            state14timer = 0;
            state14con = 1;
            state = 0;
        }
    }
    if (state14con == 3)
    {
        state14timer++;
        draw_sprite_ext(spr_statue_sound_of_justice_crumble, 6 + state14timer, x - 10, y + 15, 2, 2, 0, c_white, 1);
        if (state14timer == 11)
        {
            state14timer = 0;
            state14con = 4;
        }
    }
    if (state14con == 4)
        draw_sprite_ext(spr_statue_sound_of_justice_crumble, 17, x - 10, y + 15, 2, 2, 0, c_white, 1);
}
draw_set_color(c_white);
if (lightupcon == 1)
{
    draw_sprite_ext(spr_statue_sound_of_justice_heal_lighting, 0, x, y, image_xscale, image_yscale, image_angle, c_white, lightalpha);
    lightalpha -= 0.01;
    if (lightalpha == 0)
        lightupcon = 0;
}
else
{
    scr_enemy_drawhurt_generic();
    scr_enemy_drawidle_generic(0);
}
if (state == 12)
{
    image_index += 0.23333333333333334;
    draw_self();
    if (global.turntimer < 0)
    {
        state = 0;
        image_speed = 0.16666666666666666;
    }
}
if (state == 13)
{
    draw_self();
    dodgetimer++;
    if (dodgetimer == 2)
    {
        snd_stop(motor_swing_down);
        image_alpha = 0;
        var xx = x + 88;
        var yy = y - 88;
    }
    if (dodgetimer == 3)
    {
        image_speed = 0.16666666666666666;
        image_alpha = 1;
        sprite_index = spr_gerson_dodge;
        image_xscale = 2;
        image_yscale = 2;
        x -= 104;
        y -= 30;
        speed = 16;
        friction = 4;
    }
    if (dodgetimer == 1)
    {
        _ripple = instance_create(513, 533, obj_church_old_man_ripple_effect);
        _ripple.type = 2;
        _ripple.color = merge_color(c_red, c_black, 0);
        _ripple.colorstart = 255;
        _ripple.version = 1;
    }
    if (dodgetimer == 3 || dodgetimer == 5)
    {
        _ripple = instance_create(x + 96, y + 40, obj_church_old_man_ripple_effect);
        _ripple.type = 2;
        _ripple.color = merge_color(c_red, c_black, 0);
        _ripple.colorstart = 255;
        _ripple.version = 1;
    }
    if (dodgetimer == 38)
    {
        dodgetimer = 0;
        state = 0;
        sprite_index = spr_statue_sound_of_justice;
        x = xstart;
        y = ystart;
        image_xscale = 2;
        image_yscale = 2;
    }
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (global.turntimer > 0)
    turnframes++;
else
    turnframes = 0;
draw_set_color(c_white);
rippletimer++;
if (((rippletimer % 50) == 0 && global.myfight == 0 && global.mnfight != 1.5 && global.mnfight != 1 && phase == 2 && endingcon == 0) || susieripple == 1)
{
    if (phase == 1)
        _ripple = instance_create(camerax() + 140, cameray() + 198, obj_church_old_man_ripple_effect);
    if (phase == 2)
        _ripple = instance_create(camerax() + 110, cameray() + 198, obj_church_old_man_ripple_effect);
    _ripple.type = 2;
    _ripple.version = 2;
    _ripple.color = merge_color(c_fuchsia, c_black, 0);
    _ripple.colorstart = 16711935;
    susieripple = 0;
}
if ((rippletimer % 66) == 0 && global.myfight == 0 && global.mnfight != 1.5 && global.mnfight != 1 && state != 13 && !i_ex(obj_attackpress) && endingcon == 0)
{
    _ripple = instance_create(x + 56, y + 68, obj_church_old_man_ripple_effect);
    _ripple.type = 2;
    _ripple.version = 3;
    _ripple.color = merge_color(c_red, c_black, 0);
    _ripple.colorstart = 255;
}
if ((rippletimer % 50) == 0 && global.myfight == 0 && global.mnfight != 1.5 && global.mnfight != 1 && i_ex(obj_herokris) && endingcon == 0)
{
    _ripple = instance_create(obj_herokris.x + 30, obj_herokris.y + 48, obj_church_old_man_ripple_effect);
    _ripple.type = 2;
    _ripple.version = 2;
    _ripple.color = merge_color(c_aqua, c_black, 0);
    _ripple.colorstart = 16776960;
}

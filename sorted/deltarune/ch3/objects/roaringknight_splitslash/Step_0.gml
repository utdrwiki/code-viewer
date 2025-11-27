timer++;
if (!init)
{
    startdepth = depth;
    depth = obj_growtangle.depth + 10;
    init = true;
    slashmarker = scr_dark_marker(x, y, spr_rk_quickslash_upper);
    slashmarker.depth = obj_growtangle.depth + 50;
    slashmarker.image_speed = 0;
    slashmarker.image_alpha = 0;
    angleoffset = random_range(-12, 12);
    if (diagonal)
    {
        direction = ((obj_roaringknight_boxsplitter_attack.slash_count % 2) == 1) ? -45 : 45;
        vertical = ((obj_roaringknight_boxsplitter_attack.slash_count % 2) == 1) ? true : false;
        image_angle = direction;
        xoffset = random_range(-2, 2) * 2;
        yoffset = random_range(-2, 2) * 2;
    }
    else if (vertical)
    {
        direction = ((obj_roaringknight_boxsplitter_attack.slash_count % 2) == 1) ? -90 : 90;
        image_angle = direction;
        xoffset = random_range(-8, 8) * 2;
    }
    else
    {
        yoffset = random_range(-8, 8) * 2;
    }
    slashmarker.image_angle = image_angle;
}
if (image_alpha < 1 && !slash)
    image_alpha += 0.05;
if (!slash)
    image_blend = merge_color(c_black, c_red, clamp01(timer / 20));
if (!slash)
{
    slashmarker.image_alpha = 0;
}
else
{
    slashmarker.x = x;
    slashmarker.y = y;
    slashmarker.image_index = image_index;
    slashmarker.image_blend = image_blend;
    slashmarker.image_alpha = image_alpha;
}
if (timer <= 15)
    thickness = lerp(10, 1, scr_ease_out(timer / 15, 4));
if (timer == 38)
{
}
if (timer == 29)
    depth = startdepth;
if (timer == 30)
{
    x = xstart;
    y = ystart;
    if (image_angle == 90)
        image_yscale *= -1;
    image_angle += angleoffset;
    x += xoffset;
    y += yoffset;
    image_blend = c_white;
    active = true;
    slash = true;
    var _splitter;
    if (!i_ex(obj_knight_split_growtangle))
    {
        _splitter = instance_create(obj_growtangle.x, obj_growtangle.y, obj_knight_split_growtangle);
        scr_bullet_inherit(_splitter);
        _splitter.grazepoints = 5;
        with (obj_roaringknight_boxsplitter_attack)
        {
            growtangle = _splitter;
            _splitter.difficulty = difficulty;
        }
    }
    else
    {
        _splitter = 910;
    }
    _splitter.xoffset = xoffset;
    _splitter.yoffset = yoffset;
    _splitter.angle = angleoffset;
    obj_knight_split_growtangle.vertical = vertical;
    obj_knight_split_growtangle.diagonal = diagonal;
    obj_knight_split_growtangle.con = 1;
    obj_knight_split_growtangle.timer = 0;
    sprite_index = spr_rk_quickslash;
    image_speed = 1;
    image_index = 0;
    image_yscale *= 2;
    with (obj_roaringknight_boxsplitter_attack)
    {
        if (image_index >= 4)
            image_index = 1;
        else
            image_index = 4;
        animtimer = 0;
    }
    snd_stop(snd_wideslash_low);
    snd_stop(snd_knight_hurtb);
    snd_play_x(snd_wideslash_low, 0.8, 0.9 + (random(4) / 10));
    var _angle = image_angle;
    if (image_xscale < 0)
        _angle += 180;
    var _dirx = lengthdir_x(60, _angle);
    var _diry = lengthdir_y(60, _angle);
    for (var _i = 0; _i < 16; _i++)
    {
        var _debris = instance_create(xstart + xoffset, ystart + yoffset, obj_afterimage);
        with (_debris)
        {
            speed = random_range(10, 20);
            direction = other.image_angle + (((20 - speed) * randomsign()) / 2) + 180;
            speed += random_range(-2, 2);
            if ((_i % 2) == 0)
            {
                direction -= 180;
                speed *= 0.75;
                x += _dirx;
                y += _diry;
            }
            else
            {
                x -= _dirx;
                y -= _diry;
            }
            image_angle = direction;
            sprite_index = spr_knight_slash_mark;
            image_alpha = 1;
            image_blend = c_white;
            image_xscale = speed / 10;
            image_yscale = 0.1;
            friction = 0.5;
            fadeSpeed += random(0.02);
            scr_lerp_var_instance(id, "image_xscale", image_xscale, 0.05, 5);
        }
    }
}
if (timer == 34)
    active = false;
if (timer == (35 + hurt_delay) && playerstrike == 1)
{
    playerstrike = 0;
    obj_heart.image_alpha = 1;
    if (target != 3)
        scr_damage_maxhp(0.66, false, true);
    global.inv = global.invc * 30;
    instance_destroy();
}

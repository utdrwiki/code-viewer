if (init == 0)
{
    init = 1;
    if (!faster)
        snd_play_x(snd_great_shine, 1, 1.2);
    if (faster)
        snd_play_x(snd_great_shine, 1, 1.2);
}
siner += 1.5;
t++;
if (t >= 400 && faster)
    t++;
if (faster)
    siner += 1.5;
if (t == 400)
    snd_play(snd_revival, 1, 1);
if (t >= 400 && t < 450)
{
    rs += 0.5;
    if (faster)
        rs += 0.5;
    draw_set_color(c_white);
    for (i = 1; i < 20; i += 1)
    {
        draw_set_alpha((rs / 16) - (i / 20));
        ossafe_fill_rectangle(xstart - (i * i) - (rs * i), cameray() + 0, xstart + (i * i) + (rs * i), cameray() + 500, 0);
    }
    draw_set_alpha(1);
}
if (t == 450)
{
    with (obj_titan_spawn_enemy)
        x += 300;
}
if (t >= 450)
{
    ds2 -= 0.01;
    if (faster)
        ds2 -= 0.01;
    draw_set_alpha(ds2);
    draw_set_color(c_white);
    ossafe_fill_rectangle(camerax() - 10, cameray() - 10, camerax() + 999, cameray() + 999, false);
    draw_set_alpha(1);
}
if (t == 500)
{
    if (i_ex(obj_titan_spawn_enemy))
    {
        if (global.monsterhp[0] > 0)
        {
            _recruitanim = instance_create(camerax() + 500, cameray() + 84, obj_recruitanim);
            _recruitanim.image_index = 15;
        }
        if (global.monsterhp[1] > 0)
        {
            _recruitanim = instance_create(camerax() + 500, cameray() + 224, obj_recruitanim);
            _recruitanim.image_index = 15;
        }
    }
    with (obj_titan_spawn_enemy)
    {
        scr_spareanim();
        scr_monsterdefeat();
        instance_destroy();
    }
}
if (t == 460)
{
    with (obj_titan_enemy)
        starshootcon = 1;
}
if (t >= 540)
    image_alpha -= 0.1;
if (t >= 550 || (faster && t >= 550))
    instance_destroy();
if (t >= 540)
{
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, siner / 8);
    draw_sprite_ext(sprite_index, image_index, x, y, siner / 4, siner / 4, 0, c_white, 1.6 - (siner / 16));
    draw_sprite_ext(sprite_index, image_index, x, y, siner / 8, siner / 8, 0, c_white, 1.6 - (siner / 24));
    if (t >= 430)
    {
        if (t >= 430 && t <= 440)
        {
            if (!faster)
                timer += 10;
            if (faster)
                timer += 20;
        }
        if (t >= 450)
        {
            if (!faster)
                timer -= 1;
            if (faster)
                timer -= 2;
        }
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, timer / 100);
        d3d_set_fog(false, c_black, 0, 0);
    }
}

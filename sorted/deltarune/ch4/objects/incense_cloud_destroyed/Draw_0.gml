if (global.turntimer < 1)
{
    with (obj_animation)
    {
        if (sprite_index == spr_incense_fire_explosion1c)
            instance_destroy();
    }
    instance_destroy();
}
chainreactiontimer++;
if (type == 2)
{
    timer++;
    if (timer == 1)
    {
        snd_stop(snd_explosion_firework);
        snd_play(snd_explosion_firework);
    }
    if (timer == 1)
    {
        var dir = -20 + random(40) + image_angle;
        var len = 10 + random(15);
        fx = instance_create_depth(x + lengthdir_x(len, dir), y + lengthdir_y(len, dir), depth - 5, obj_animation);
        fx.sprite_index = spr_incense_fire_explosion1c;
        fx.image_speed = 0.5;
        dir = 160 + random(40) + image_angle;
        len = random(25);
        fx = instance_create_depth(x + lengthdir_x(len, dir), y + lengthdir_y(len, dir), depth - 5, obj_animation);
        fx.sprite_index = spr_incense_fire_explosion1c;
        fx.image_speed = 0.5;
    }
    if (timer == 5)
    {
        var angle = irandom(360);
        repeat (4)
        {
            inst = instance_create(x, y, obj_incense_bullet_fire);
            inst.image_angle = angle;
            inst.direction = angle;
            inst.image_speed = 0.5;
            inst.image_xscale = 0.5;
            inst.image_yscale = 0.5;
            inst.speed = 1;
            inst.friction = -0.1;
            inst.chainreaction = chainreaction;
            angle += 90;
        }
        instance_destroy();
    }
}
if (type == 1)
{
    if (con == 0)
    {
        timer++;
        if (timer == 1)
        {
            con = 1;
            timer = 0;
        }
    }
    if (con == 1)
    {
        var angle = irandom(360);
        repeat (4)
        {
            inst = instance_create(x, y, obj_incense_bullet_fire);
            inst.image_angle = angle;
            inst.direction = angle;
            inst.image_speed = 0.5;
            inst.image_xscale = 0.5;
            inst.image_yscale = 0.5;
            inst.speed = 1;
            inst.friction = -0.1;
            inst.chainreaction = chainreaction;
            angle += 45;
        }
        con = 2;
    }
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (type == 0)
{
    if (con == 0)
    {
        timer++;
        if (timer == 5)
        {
            con = 1;
            timer = 0;
        }
    }
    if (con > 0)
        DissolveAmount -= 0.08;
    if (con == 1 && DissolveAmount < 0.8)
    {
        var angle = irandom(360);
        repeat (4)
        {
            inst = instance_create(x, y, obj_incense_bullet_fire);
            inst.image_angle = angle;
            inst.direction = angle;
            inst.image_speed = 0.5;
            inst.image_xscale = 0.5;
            inst.image_yscale = 0.5;
            inst.speed = 1;
            inst.friction = -0.1;
            inst.chainreaction = chainreaction;
            angle += 90;
        }
        con = 2;
    }
    if (DissolveAmount < 0)
        instance_destroy();
    DissolveShader(sprite_index, image_index, x, y, DissolveAmount);
}

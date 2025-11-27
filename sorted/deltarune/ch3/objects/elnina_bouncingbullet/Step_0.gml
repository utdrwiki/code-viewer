if (image_alpha < 1)
    image_alpha += 0.1;
var touchedbottom = 0;
if (forceminigametocontinue)
    obj_tenna_zoom.minigameinsanitytimer = obj_tenna_zoom.minigameinsanitytimermax - 2;
var bottomy;
if (i_ex(obj_growtangle))
{
    var _sprite_width = 150;
    var _sprite_height = 150;
    var width = sprite_width / 4;
    var leftx = (obj_growtangle.x - (_sprite_width / 2)) + width;
    var rightx = (obj_growtangle.x + (_sprite_width / 2)) - width;
    bottomy = (obj_growtangle.y + (_sprite_height / 2)) - (sprite_height / 2);
    if (x < leftx)
    {
        hspeed = abs(hspeed);
        x += 2;
    }
    if (x > rightx)
    {
        hspeed = -abs(hspeed);
        x -= 2;
    }
    if (y > bottomy)
    {
        vspeed = -abs(vspeed) * 1.5;
        y -= 2;
        forceminigametocontinue = false;
        touchedbottom = 1;
    }
    x = clamp(x, leftx, rightx);
}
if (vspeed < 8)
    vspeed += 0.5;
if (abs(hspeed) > 6)
    hspeed *= 0.95;
bounce_buffer--;
if (touchedbottom && image_blend != c_ltgray)
{
    if (difficulty >= 2)
    {
        snd_stop(snd_error);
        snd_play_x(snd_error, 0.6, 2);
        snd_play_x(snd_error, 0.6, 1.5 + random(0.2));
        var angleoffset = random_range(-20, 20);
        var bulletamount = 5;
        var baseangle = 90;
        var spread = 42;
        for (var i = 0; i < bulletamount; i++)
        {
            var mybullet = instance_create(x, bottomy + 8, obj_regularbullet);
            mybullet.sprite_index = spr_shutta_lightning;
            mybullet.speed = 1;
            mybullet.friction = -0.1;
            mybullet.depth = depth + 10;
            mybullet.direction = (baseangle - (spread * 2)) + (spread * i) + angleoffset;
            mybullet.image_angle = mybullet.direction;
            mybullet.image_speed = 0.25;
            mybullet.image_yscale = 0.5;
            scr_lerp_var_instance(mybullet, "image_alpha", 5, 0, 60, 0);
            with (mybullet)
                scr_var_delay("active", 0, 50);
            scr_doom(mybullet, 60);
            scr_bullet_inherit(mybullet);
        }
        var shrinkmarker = scr_marker(x, bottomy + 8, spr_ball_30);
        shrinkmarker.depth = depth + 9;
        shrinkmarker.image_xscale = 1;
        shrinkmarker.image_yscale = 1;
        scr_doom(shrinkmarker, 20);
        scr_lerpvar_instance(shrinkmarker, "image_xscale", 1, 0, 20, -1, "out");
        scr_lerpvar_instance(shrinkmarker, "image_yscale", 1, 0, 20, -1, "out");
    }
}
if (difficulty == 3)
{
    if (instance_number(object_index) < 2)
    {
        if (bounce_count < 56)
        {
            var newball = instance_create(obj_growtangle.x, cameray() + 20, object_index);
            newball.depth = depth + 1;
            newball.difficulty = 3;
            scr_bullet_inherit(newball);
        }
    }
    if (instance_number(object_index) < 3)
    {
        if (bounce_count < 36)
        {
            var newball = instance_create(obj_growtangle.x, cameray() + 20, object_index);
            newball.depth = depth + 1;
            newball.difficulty = 0;
            newball.image_blend = c_ltgray;
            scr_bullet_inherit(newball);
        }
    }
}
if (difficulty == 2)
{
    if (instance_number(object_index) < 2)
    {
        if (bounce_count < 10)
        {
            var newball = instance_create(obj_growtangle.x, cameray() + 20, object_index);
            newball.depth = depth + 1;
            newball.difficulty = 0;
            newball.image_blend = c_ltgray;
            scr_bullet_inherit(newball);
        }
    }
}

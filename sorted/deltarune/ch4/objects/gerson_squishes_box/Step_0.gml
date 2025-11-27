if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        vspeed = -48;
        snd_play(snd_jump);
        snd_play(snd_rocket);
        snd_play(snd_screenshake);
        d = instance_create(0, 0, obj_shake);
        d.shakex = ceil(2);
        d.shakey = ceil(2);
    }
    flash = instance_create(x, y, obj_afterimage);
    flash.sprite_index = sprite_index;
    flash.image_index = image_index;
    flash.image_xscale = image_xscale;
    flash.image_yscale = image_yscale;
    flash.image_blend = image_blend;
    flash.image_speed = 0;
    flash.image_alpha = 1.5;
    flash.fadeSpeed = 0.2;
    if (vspeed < 0)
        vspeed += 0.8;
    if (timer == 14)
    {
        timer = 0;
        con = 1;
        vspeed = 0;
        x = obj_growtangle.x;
        y = cameray();
        sprite_index = spr_gerson_dodge_origin_top_bottom;
        image_index = 0;
    }
}
if (con == 1)
{
    if (timer < 5)
        timer++;
    y = lerp(cameray(), obj_growtangle.y - 70, timer / 5);
    if (timer == 5)
    {
        y = obj_growtangle.y - 70;
        con = 2;
        timer = 0;
        snd_play(snd_screenshake);
        d = instance_create(0, 0, obj_shake);
        d.shakex = ceil(2);
        d.shakey = ceil(2);
    }
}
if (con == 2)
{
    with (obj_hammer_of_justice_enemy)
        squishbox = true;
    timer++;
    var timermax = 10;
    if (timer <= timermax)
    {
        var maxscalex = lerp(9, 6, timer / timermax);
        var maxscaley = lerp(0.2, 1, timer / timermax);
        obj_growtangle.image_xscale = lerp(obj_growtangle.image_xscale, maxscalex, timer / timermax);
        obj_growtangle.image_yscale = lerp(obj_growtangle.image_yscale, maxscaley, timer / timermax);
    }
    if (timer > timermax)
    {
        var maxscalex = lerp(5, 6, timer / 15);
        var maxscaley = lerp(1.2, 1, timer / 15);
        obj_growtangle.image_xscale = lerp(obj_growtangle.image_xscale, maxscalex, timer / 15);
        obj_growtangle.image_yscale = lerp(obj_growtangle.image_yscale, maxscaley, timer / 15);
    }
    y = obj_growtangle.y - (35 * obj_growtangle.image_yscale);
    if (timer >= 15)
    {
        instance_create(x, y - 67, obj_gerson_teleport);
        instance_destroy();
    }
}

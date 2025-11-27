if (button1_p())
    shootcon = 1;
var fingerx = x + 28;
var fingery = y - 16;
if (shootcon == 1)
{
    sprite_index = spr_kris_ride_shoot;
    image_index = 0;
    image_speed = 0;
    var impactfx = instance_create(fingerx, fingery, obj_animation);
    impactfx.sprite_index = spr_attack_slap2;
    impactfx.image_xscale = 0.25;
    impactfx.image_yscale = 0.25;
    impactfx.image_blend = c_white;
    for (var i = 0; i < 8; i++)
    {
        var smokefx = scr_marker(fingerx, fingery, spr_slidedust);
        smokefx.hspeed = random_range(-2, 8);
        smokefx.gravity_direction = 180;
        smokefx.gravity = 2 - random(0.4);
        smokefx.image_speed = 0.2;
        smokefx.image_xscale = 2 + random(1);
        smokefx.image_yscale = 2 + random(1);
        smokefx.vspeed = random_range(-4, 0);
        scr_lerp_var_instance(smokefx, "image_alpha", 0.6, 0, 12);
        scr_doom(smokefx, 12);
    }
    var hitheart = instance_create(fingerx, fingery, obj_shootout_vfx_mockup_shot);
    hitheart.targetx = x + 300;
    hitheart.targety = y - 100;
    snd_play_x(snd_punchmed, 0.8, 0.8 + random(0.2));
    timer = 0;
    shootcon = 2;
}
if (shootcon == 2)
{
    if (sprite_index == spr_kris_ride_shoot)
    {
        if (timer == 0)
            image_index = 0;
        if (timer == 1)
            image_index = 2;
        timer++;
        if (timer >= 6)
        {
            sprite_index = spr_kris_ride_1;
            image_index = 0;
            shootcon = 0;
        }
    }
}

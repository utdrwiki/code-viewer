image_xscale = 2;
image_yscale = 2;
depth = 20;
if (button1_p() && testhurt == 0)
    testhurt = 1;
if (button2_p())
    con = 1;
var gunx = x - 50;
var guny = y + 50;
if (con == 1)
{
    sprite_index = spr_shootout_tenna_shoot;
    var shot = instance_create(gunx, guny, obj_shootout_vfx_mockup_shot);
    shot.enemy = 1;
    shot.targetx = x - 200;
    shot.targety = y + 100;
    shot.sprite_index = spr_smallbullet;
    con = 2;
    var impactfx = instance_create(gunx, guny, obj_animation);
    impactfx.sprite_index = spr_attack_slap2;
    impactfx.image_speed = 2;
    impactfx.image_xscale = 1;
    impactfx.image_yscale = 1;
    impactfx.image_blend = c_white;
    impactfx.depth = depth - 10;
    impactfx = instance_create(gunx, guny, obj_animation);
    impactfx.sprite_index = spr_attack_slap2;
    impactfx.image_speed = 1;
    impactfx.image_xscale = 1;
    impactfx.image_yscale = 1;
    impactfx.image_blend = c_red;
    impactfx.depth = depth - 10;
    for (var i = 0; i < 8; i++)
    {
        var smokefx = scr_marker(gunx, guny, spr_slidedust);
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
}
if (testhurt == 1)
{
    image_index = 0;
    image_speed = 0;
    sprite_index = spr_shootout_tenna_hit;
    scr_shakeobj(id, 24, 3);
    testhurt = 0;
    timer = 0;
}

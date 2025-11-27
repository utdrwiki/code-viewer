draw_sprite_ext(spr_tennadeath_static, irandom(sprite_get_number(spr_tennadeath_static)), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (testbars)
    draw_sprite_ext(spr_tennadeath_testbars, 0, x, y, 1, 1, image_angle, image_blend, image_alpha);
draw_self();
if (armsparks)
{
    draw_sprite_ext(spr_tennadeath_armsparks, irandom(sprite_get_number(spr_tennadeath_armsparks)), x, y, image_xscale + random(0.3), image_yscale - random(0.1), image_angle, image_blend, image_alpha - 0.4);
    draw_sprite_ext(spr_tennadeath_armsparks, irandom(sprite_get_number(spr_tennadeath_armsparks)), x, y + 20, image_xscale + random(0.3), image_yscale - 0.4, image_angle, image_blend, image_alpha - 0.4);
    with (bg_arm)
        image_angle -= 0.5;
    with (fg_arm)
        image_angle += 0.5;
}
if (con == 0)
{
    con = 1;
    timer = 0;
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        snd_play(snd_impact);
        snd_play_x(snd_closet_impact, 1, 1);
        snd_play_x(snd_closet_impact, 1, 0.5);
        snd_play_x(snd_bageldefeat, 0.8, 0.8);
        snd_play(snd_damage);
        snd_play_x(snd_glassbreak, 0.8, 0.4);
        snd_play_x(snd_glassbreak, 0.6, 0.3);
        var dmg = instance_create(x + 100, y + 180, obj_dmgwriter);
        with (dmg)
        {
            damage = 5500 + floor(random(500));
            type = 0;
            lightb = 255;
        }
        dmg.depth = depth - 20;
        scr_shakeobj_ext(id, 20, 40, 2, 2);
        fg_arm.gravity = 0.75;
        bg_arm.gravity = 0.5;
        fg_arm.hspeed = -3;
        fg_arm.friction = 0.05;
        bg_arm.hspeed = -5;
        bg_arm.friction = 0.05;
        bg_arm.vspeed = -5;
        fg_arm.vspeed = -6;
    }
    if (timer == 2)
        armsparks = 1;
    if (timer == 50)
    {
        var beep = snd_play_x(snd_tenna_beep_loop, 1, 1.2);
        var beep2 = snd_play_x(snd_tenna_beep_loop, 1, 1.11);
        var beep3 = snd_play_x(snd_tenna_beep_loop, 1, 1.08);
        snd_volume(beep, 0.7, 0);
        snd_volume(beep, 0, 60);
        snd_volume(beep2, 0.7, 0);
        snd_volume(beep2, 0, 75);
        snd_volume(beep3, 0, 80);
        testbars = true;
        vspeed = 0.5;
    }
    if (timer == 110)
        gravity = 1;
    if (timer >= 50)
    {
        x += 1;
        image_angle -= 0.2;
    }
}

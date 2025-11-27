scr_bullet_init();
scr_darksize();
wibbly_cooldown = 10;
active = false;
destroyonhit = false;
scr_var_delayed("active", true, 30);
light_rate = 0.0025;
with (obj_titan_enemy)
{
    if (phase < 6)
        other.light_rate = 0.00625;
    if (phase < 4)
        other.light_rate = 0.004375;
    if (phase < 2)
        other.light_rate = 0.0025;
}
image_speed = 0;
visible = false;
mask_index = spr_titan_battle_finger_dark_mask;
break_store = "nothing";
counter = 3;
light = 0;
weakspot_sprite = 4096;
weak_dist = 40;
weak_off[0] = 0;
weak_off[1] = 10;
weak_off[2] = 14;
weak_off[3] = 14;
weak_off[4] = 15;
weak_off[5] = 14;
weak_off[6] = 14;
weak_off[7] = 10;
weak_bonus = 52;

wibbly_bullets = function()
{
    var randlength = 110 + irandom(20);
    with (scr_fire_bullet(x + lengthdir_x(randlength, image_angle), y + lengthdir_y(randlength, image_angle), obj_regularbullet, irandom(360), 0, spr_wibblywobbly_dark_bullet))
    {
        damage = 90;
        target = 4;
        parent_id = other.master.id;
        image_speed = 0.5;
        scr_lerpvar("speed", 0, 1.5, 60);
        image_xscale = 0;
        image_yscale = 0;
        scr_lerpvar("image_xscale", 0, 2, 15, 1, "out");
        scr_lerpvar("image_yscale", 0, 2, 15, 1, "out");
    }
};

darkdraw = function()
{
    var cur_weak_dist = (weak_dist - (weak_off[image_index] * 2)) + weak_bonus;
    var hx = obj_heart.x + 10;
    var hy = obj_heart.y + 10;
    var myx = x + lengthdir_x(cur_weak_dist, image_angle);
    var myy = y + lengthdir_y(cur_weak_dist, image_angle);
    var xshake, yshake;
    if (point_distance(myx, myy, hx, hy) < 64)
    {
        xshake = choose(-1, 0, 1);
        yshake = choose(-1, 0, 1);
    }
    else
    {
        xshake = 0;
        yshake = 0;
    }
    draw_sprite_ext(spr_titan_battle_finger_dark, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(weakspot_sprite, 3 - image_index, (x + lengthdir_x(cur_weak_dist, image_angle) + xshake) - __view_get(e__VW.XView, 0), (y + lengthdir_y(cur_weak_dist, image_angle) + yshake) - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle - (15 * image_yscale), image_blend, image_alpha);
    gpu_set_blendmode(bm_add);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(spr_titan_battle_finger_dark, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, light);
    draw_sprite_ext(weakspot_sprite, 3 - image_index, (x + lengthdir_x(cur_weak_dist, image_angle) + xshake) - __view_get(e__VW.XView, 0), (y + lengthdir_y(cur_weak_dist, image_angle) + yshake) - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle - (15 * image_yscale), image_blend, light);
    d3d_set_fog(false, c_white, 0, 0);
    gpu_set_blendmode(bm_normal);
};

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}

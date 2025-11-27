image_index = floor(image_index);
var pips = image_index / 4;
if (sprite_index == spr_bullet_dice_all4s)
    pips = 3;
event_user(0);
with (instance_create(x, y, obj_regularbullet))
{
    image_blend = c_gray;
    sprite_index = other.sprite_index;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
    image_angle = other.image_angle;
    image_index = other.image_index;
    image_blend = other.image_blend;
    image_speed = 0;
    mask_index = spr_nothing;
    active = false;
    grazed = true;
    scr_lerpvar("image_xscale", image_xscale, 3, 5);
    scr_lerpvar("image_yscale", image_yscale, 3, 5);
    scr_lerpvar("image_alpha", image_yscale, 0, 5);
}
bullet = instance_create(x, y, obj_bullet_dice_shockwave);
bullet.target = target;
bullet.damage = 40;
bullet.grazepoints = 4;
bullet.count = 0;
bullet.image_xscale = 1.5;
bullet.image_yscale = 1.5;
if (pips >= 3 || (sprite_index == spr_bullet_dice && image_index >= 8) || (sprite_index == spr_bullet_dice4pip && image_index >= 8))
{
    bullet.image_xscale = 2;
    bullet.image_yscale = 2;
}

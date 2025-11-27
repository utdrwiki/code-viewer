scr_darksize();
master = noone;
timer = 0;
con = 0;
with (obj_tenna_enemy)
{
    other.x = camerax() + 525 + shakex + hurtspriteoffx;
    other.y = cameray() + 255 + hurtspriteoffy;
    other.master = id;
    other.depth = 1402;
}
master.tenna_actor.x = -9999;
fronttenna = instance_create(x, y, obj_marker);
fronttenna.sprite_index = sprite_index;
fronttenna.image_speed = image_speed;
fronttenna.image_index = image_index;
fronttenna.image_xscale = image_xscale;
fronttenna.image_yscale = image_yscale;
fronttenna.x = x;
fronttenna.y = y;
fronttenna.image_alpha = 0;
fronttenna.depth = obj_darkener.depth - 10;
image_speed = 0;
vspeed = -16;
gravity = 1;

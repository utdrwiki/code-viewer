x = distx;
y = disty;
if (!i_ex(obj_heart))
{
    heart = instance_create(x, y, obj_heart);
    if (i_ex(obj_jackenstein_enemy))
        sprite_index = spr_dodgeheart_small;
}
instance_destroy();

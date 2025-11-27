for (var i = 0; i < bullets; i++)
{
    with (instance_create(x, y, obj_regularbullet))
    {
        other.bullet[i] = id;
        sprite_index = spr_bullet_ghostfire;
        angle = (360 / other.bullets) * i;
        dist = 0;
        visible = false;
    }
    scr_bullet_inherit(bullet[i]);
}

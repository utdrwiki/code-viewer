for (var i = 0; i < bullets; i++)
{
    with (instance_create(x, y, obj_regularbullet))
    {
        other.bullet[i] = id;
        target = other.target;
        sprite_index = spr_bullet_ghostfire;
        image_speed = 1/3;
        angle = (360 / other.bullets) * i;
        dist = 0;
        visible = false;
    }
    scr_bullet_inherit(bullet[i]);
}

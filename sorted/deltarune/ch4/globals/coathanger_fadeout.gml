function scr_coathanger_fadeout()
{
    if (i_ex(id))
    {
        with (obj_regularbullet)
        {
            if (point_distance(x, y, other.x, other.y) < 1 && sprite_index == spr_bullet_coathanger && id != other.id)
                instance_destroy();
        }
    }
}

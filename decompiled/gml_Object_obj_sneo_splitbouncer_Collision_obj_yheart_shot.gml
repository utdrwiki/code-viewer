if (destroyable == true)
{
    hp--
    if (other.big == 1 || hp <= 0)
    {
        breaking = 10
        destroyable = false
        speed = 0
        obj_shrinktangle.sizeup += shrinksize
        image_blend = c_white
        sprite_index = spr_sneo_c_weakpoint_hit
    }
    flash = true
    if (other.big == 0)
    {
        with (other)
            event_user(0)
    }
}

if (other.object_index != object_index && other.sprite_index != spr_spark && other.object_index != obj_pendulum)
{
    with (other)
    {
        var _cut = scr_afterimage_cut_half();
        _cut.flash = true;
        instance_destroy();
    }
}

shader_set(shd_invert);
with (obj_regularbullet)
{
    if (!visible && sprite_index == spr_tenna_smash_lightning)
        draw_self();
}
shader_reset();

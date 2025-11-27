with (obj_shootout_window)
    instance_destroy();
with (obj_shootout_fire)
    instance_destroy();
with (obj_shootout_bullet_line)
    instance_destroy();
with (obj_shootout_cactus)
    instance_destroy();
with (obj_shootout_heart)
    instance_destroy();
with (obj_shootout_kris)
    instance_destroy();
with (obj_shootout_horse)
    instance_destroy();
with (obj_shootout_hazard)
    instance_destroy();
with (obj_shootout_susie)
    instance_destroy();
with (obj_shootout_text)
    instance_destroy();
with (obj_shootout_dog_item)
    instance_destroy();
with (obj_shootout_line)
    instance_destroy();
with (obj_shootout_dust)
    instance_destroy();
with (obj_shootout_carriage)
    instance_destroy();
with (obj_shootout_tenna_reticle)
    instance_destroy();
with (obj_afterimage)
    instance_destroy();
with (obj_oflash)
    instance_destroy();
with (obj_shootout_vfx_mockup_shot)
    instance_destroy();
with (obj_shootout_big_tenna)
    instance_destroy();
with (obj_marker)
{
    if (sprite_index == spr_shadowman_sharpshoot_heart)
        instance_destroy();
}
with (obj_snd_complex)
    instance_destroy();
if (i_ex(obj_tenna_enemy))
{
    layer_background_destroy(fg);
    layer_background_destroy(md);
    layer_background_destroy(md_back);
    layer_background_destroy(bg);
    if (beatwithoutgettinghit == true && obj_shootout_controller.shootout_type == 2)
        obj_tenna_enemy.cowboy1tooknodamage = true;
}

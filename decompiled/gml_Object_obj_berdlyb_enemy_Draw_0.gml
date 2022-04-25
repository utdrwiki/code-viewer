if (becomeflash == false)
    flash = false
becomeflash = false
fsiner++
if (instance_exists(o_coaster_berdly) && (!instance_exists(obj_berdlyb_spearblaster)) && state != 3)
    return;
if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5)
    scr_enemy_drawhurt_generic()
}

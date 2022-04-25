scr_bullet_inherit_ch1 = function(argument0) //gml_Script_scr_bullet_inherit_ch1
{
    if instance_exists(argument0)
    {
        argument0.damage = damage
        argument0.grazepoints = grazepoints
        argument0.timepoints = timepoints
        argument0.inv = inv
        argument0.target = target
        argument0.grazed = false
        argument0.grazetimer = 0
    }
    return;
}


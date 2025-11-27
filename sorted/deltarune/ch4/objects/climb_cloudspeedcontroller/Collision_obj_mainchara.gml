if (con == 1)
    exit;
if (i_ex(obj_cloud_controller_new))
{
    scr_lerp_instance_var(349, "minspeed", obj_cloud_controller_new.minspeed, minspeed, 30);
    scr_lerp_instance_var(349, "maxspeed", obj_cloud_controller_new.maxspeed, maxspeed, 30);
}
con = 1;

con = -1;
customcon = 0;
leave_con = 0;
dess_blocker = global.plot < 60;
if (dess_blocker)
{
    dess_collider = instance_create(420, 340, obj_solidblockLight);
    dess_collider.image_xscale = 2;
}
launch_treat = false;
if (global.plot >= 60)
    instance_destroy();

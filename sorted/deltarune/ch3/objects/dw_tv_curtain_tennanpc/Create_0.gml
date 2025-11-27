setxy(3240, 280);
tenna = instance_create(x, y, obj_actor_tenna);
trig = instance_create(x - 80, y - 200, obj_trigger_interact);
with (trig)
{
    scr_size(15, 17.5);
    issolid = true;
}
con = 0;
timer = 0;
talked = 0;

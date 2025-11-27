function scr_moveheart()
{
    global.inv = 0;
    return instance_create(obj_herokris.x + 10, obj_herokris.y + 40, obj_moveheart);
}

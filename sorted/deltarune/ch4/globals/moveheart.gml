function scr_moveheart()
{
    global.inv = 0;
    if (global.chapter == 4 && (i_ex(obj_hammer_of_justice_enemy) || i_ex(obj_sound_of_justice_enemy)))
        return instance_create(obj_herosusie.x - 250, obj_herosusie.y + 40, obj_moveheart);
    else
        return instance_create(obj_herokris.x + 10, obj_herokris.y + 40, obj_moveheart);
}

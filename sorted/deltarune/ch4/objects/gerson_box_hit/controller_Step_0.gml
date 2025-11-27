timer++;
if (timer == 16 && countmax == count)
{
    with (obj_hammer_of_justice_enemy)
        visible = false;
    instance_create(obj_hammer_of_justice_enemy.x + 45, obj_hammer_of_justice_enemy.y + 45, obj_gerson_teleport);
}
if (timer == 25)
{
    count--;
    if (count == -1)
    {
        global.turntimer = 12;
        exit;
    }
    if (con == 0)
    {
        leftgerson = instance_create(obj_growtangle.x - 180, obj_growtangle.y + 20, obj_gerson_teleport);
        leftgerson.type = 1;
    }
    else
    {
        rightgerson = instance_create(obj_growtangle.x + 180, obj_growtangle.y + 20, obj_gerson_teleport);
        rightgerson.type = 1;
        rightgerson.image_xscale = -2;
    }
    if (con == 0)
        con = 1;
    else
        con = 0;
    if (irandom(100) < 50)
        con = choose(0, 1);
    timer = 0;
}
if (timer == 36)
{
    gers = instance_create(obj_hammer_of_justice_enemy.x + 45, obj_hammer_of_justice_enemy.y + 45, obj_gerson_teleport);
    gers.type = 10;
    instance_destroy();
}

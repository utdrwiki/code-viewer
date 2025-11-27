if (phone_con == 1 && !d_ex())
{
    phone_con = 2;
    global.msc = 1307;
    scr_text(global.msc);
    remanimspeed = image_speed;
    myinteract = 3;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    mydialoguer.jpspecial = jpspecial;
    talked += 1;
}
else
{
    event_inherited();
}

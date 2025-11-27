if (init == 0)
{
    init = 1;
    if (type == 2)
    {
        mysolid = instance_create(x, y, obj_board_solid);
        mysolid.sprite_index = sprite_index;
        scr_darksize(mysolid);
    }
}
if (type == 0)
{
    timer++;
    if (timer > 120)
    {
        if (visible == true)
            visible = false;
        else
            visible = true;
    }
    if (timer > 150)
        instance_destroy();
}
if (type == 2)
{
    if (global.flag[1044] >= cost)
    {
        mysolid.x = room_width * 4;
    }
    else
    {
        with (mysolid)
            setxy(other.x, other.y);
    }
}
if (place_meeting(x, y, obj_board_swordhitbox))
    myinteract = 3;
if (myinteract == 3)
{
    if (type == 0)
    {
        if (timer < 10)
            exit;
        if (obj_board_controller.kris_object.myhealth < 1)
            exit;
        instance_destroy();
        obj_board_controller.kris_object.myhealth += 2;
        snd_play(snd_power);
    }
    if (type == 1)
    {
        snd_play(snd_power);
        with (obj_mainchara_board)
            myhealth += 2;
        instance_destroy();
    }
    if (type == 2)
    {
        if (global.flag[1044] >= cost)
        {
            scr_board_score(-cost);
            global.flag[1117] += cost;
            snd_play(snd_power);
            with (obj_mainchara_board)
                myhealth += 2;
            instance_destroy();
        }
        else
        {
        }
    }
    myinteract = 0;
}
scr_depth_board();

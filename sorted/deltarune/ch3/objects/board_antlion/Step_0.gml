if (init == 0)
{
    speed = minspeed;
    init = 1;
}
if (con == 0)
{
    image_alpha = 0;
    speed = lerp(speed, minspeed, 0.25);
    timer++;
    if (timer == 1)
        inactivetarg = irandom_range(50, 90);
    if (timer >= inactivetarg)
    {
        image_alpha = 1;
        image_index = 0;
        timer = 0;
        con = 0.5;
        var specialcheck = 0;
        with (object_index)
        {
            if (special == 1)
                specialcheck = 1;
        }
        if (global.flag[1227] == 1)
            specialcheck = 1;
        if (!variable_instance_exists(id, "nospecialsanymore"))
            nospecialsanymore = 0;
        if (nospecialsanymore)
            specialcheck = 1;
        if (specialcheck == 0)
            special = choose(0, 0, 0, 1);
        if ((direction % 90) == 0)
        {
            debug_print("too still!");
            direction = 33 * choose(1, 2, 3, 4);
        }
    }
}
if (con == 0.5)
{
    timer++;
    if (timer == 2)
        image_index = 1;
    if (timer == 4)
        image_index = 2;
    if (timer == 6)
    {
        con = 1;
        image_index = 3;
    }
}
if (con == 1)
{
    speed = lerp(speed, maxspeed, 0.25);
    timer++;
    if (timer == 1)
    {
        activetarg = irandom_range(30, 60);
        if (special)
            activetarg = irandom_range(25, 40);
    }
    if ((timer % 4) == 0)
    {
        if (image_index == 5)
            image_index = 4;
        else
            image_index = 5;
    }
    if (timer >= activetarg)
    {
        timer = 0;
        con = 2;
        image_index = 3;
    }
}
if (con == 2)
{
    speed = lerp(speed, minspeed, 0.25);
    timer++;
    if (timer == 2)
        image_index = 2;
    if (timer == 4)
        image_index = 1;
    if (timer == 6)
        image_index = 0;
    if (timer == 8)
    {
        image_alpha = 0;
        timer = 0;
        con = 0;
        if (hide == 1)
            con = 40;
        special = 0;
    }
}
if (con == 99)
{
    timer++;
    if (timer == 10)
    {
        with (instance_create(x + 16, y + 16, obj_board_perfumefountainphotoeffect))
            depth = other.depth - 1000;
    }
    if (timer == 100)
    {
        speed = memspeed;
        con = 2;
        timer = 0;
    }
}
if (con == 50)
{
    timer++;
    if (timer == 0)
    {
        image_alpha = 1;
        snd_play_x(snd_board_splash, 0.7, 0.6);
    }
    if (timer == 2)
        image_index = 1;
    if (timer == 4)
        image_index = 2;
    if (timer == 6)
    {
        snd_play_x(snd_board_splash, 1, 1.2);
        con = 51;
        timer = 0;
        image_index = 3;
    }
}
if (con == 51)
{
    speed = 0;
    timer++;
    if ((timer % 4) == 0)
    {
        if (image_index == 5)
            image_index = 4;
        else
            image_index = 5;
    }
}
scr_depth_board();
if (con < 50)
{
    if (x < board_tilex(1))
    {
        hspeed = -hspeed;
        x = board_tilex(1);
    }
    if (x > board_tilex(10))
    {
        hspeed = -hspeed;
        x = board_tilex(10);
    }
    if (y > board_tiley(6))
    {
        vspeed = -vspeed;
        y = board_tiley(6);
    }
    if (y < board_tiley(2.25))
    {
        vspeed = -vspeed;
        y = board_tiley(2.25);
    }
    var dobounce = 0;
    if (dobounce)
    {
        if (image_alpha == 1)
        {
            var meet = instance_place(x + hspeed, y + vspeed, object_index);
            if (i_ex(meet))
            {
                if (meet.image_alpha == 1)
                {
                    hspeed = -hspeed;
                    vspeed = -vspeed;
                    meet.hspeed = -hspeed;
                    meet.vspeed = -vspeed;
                }
            }
        }
    }
}
if (obj_board_camera.shift != "none")
    instance_destroy();

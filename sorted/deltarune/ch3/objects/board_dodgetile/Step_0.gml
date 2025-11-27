if (tilecon == 1 && obj_mainchara_board.movingnow == 0)
{
    timer++;
    if (timer == 5)
        tilecon = 1.1;
}
if (tilecon == 1.1)
{
    wheel = instance_create(0, 0, obj_board_quizwheel);
    wheel.maxslices = wheelchoices;
    wheel.slicetext[0] = "SWEET";
    wheel.slicetext[1] = "SPICY";
    wheel.slicetext[2] = "MILD";
    wheel.slicetext[3] = "OOOO MOMMY~";
    wheel.daddy = id;
    tilecon = -1;
}
if (tilecon == 2)
{
    timer = 0;
    growtangle = instance_create(x + 16, y + 16, obj_growtangle);
    growtangle.maxxscale = 1.4;
    growtangle.maxyscale = 1.4;
    growtangle.depth = obj_mainchara_board.depth - 60;
    heart = instance_create(growtangle.x - 6, growtangle.y - 8, obj_heart);
    heart.sprite_index = spr_board_heart;
    heart.depth = obj_mainchara_board.depth - 80;
    tilecon = 2.1;
}
if (tilecon == 2.1)
{
    obj_grazebox.sprite_index = spr_board_grazeappear;
    obj_grazebox.sizexoff = -2;
    obj_grazebox.sizeyoff = -2;
    for (var i = 0; i < 5; i++)
    {
        var foundInst = 0;
        while (foundInst == 0)
        {
            var inst = instance_find(obj_board_enemy_parent_old, irandom(instance_number(obj_board_enemy_parent_old) - 1));
            with (inst)
            {
                var isonscreen = false;
                if (x >= 128 && x < 512 && y >= 64 && y < 320)
                    isonscreen = true;
                var tooclose = false;
                var toocloseobj = collision_rectangle(x - 64, y - 64, x + 96, y + 96, obj_mainchara_board, 0, 0);
                if (toocloseobj != -4)
                    tooclose = true;
                if (isonscreen && !tooclose)
                {
                    other.enemylist[i] = inst;
                    foundInst = 1;
                }
            }
        }
    }
    if (enemylist[0] == enemylist[1] || enemylist[0] == enemylist[2] || enemylist[0] == enemylist[3] || enemylist[0] == enemylist[4])
        enemylist[0] = 0;
    if (enemylist[1] == enemylist[0] || enemylist[1] == enemylist[2] || enemylist[1] == enemylist[3] || enemylist[1] == enemylist[4])
        enemylist[1] = 0;
    if (enemylist[2] == enemylist[1] || enemylist[2] == enemylist[0] || enemylist[2] == enemylist[3] || enemylist[2] == enemylist[4])
        enemylist[2] = 0;
    if (enemylist[3] == enemylist[1] || enemylist[3] == enemylist[2] || enemylist[3] == enemylist[0] || enemylist[3] == enemylist[4])
        enemylist[3] = 0;
    if (enemylist[4] == enemylist[1] || enemylist[4] == enemylist[2] || enemylist[4] == enemylist[3] || enemylist[4] == enemylist[0])
        enemylist[4] = 0;
    var enemyCount = 0;
    for (var i = 0; i < 5; i++)
    {
        if (enemylist[i] != 0)
            enemyCount++;
    }
    scr_debug_print("enemyCount=" + string(enemyCount));
    for (var i = 0; i < 5; i++)
    {
        if (enemylist[i] != 0)
        {
            with (enemylist[i])
                con = 1;
        }
    }
    if (enemyCount < 4)
        instance_create(x, y, obj_board_enemy_offscreenevent);
    tilecon = 3;
}
if (tilecon == 3)
{
    image_alpha = lerp(image_alpha, 0, 0.1);
    timer++;
    if (timer == 120)
    {
        growtangle.growcon = 3;
        tilecon = 4;
    }
}
if (tilecon == 4)
{
    with (obj_board_enemy_parent_old)
    {
        if (con != 0)
            con = 3;
    }
    with (obj_board_collidebullet)
        active = 0;
    if (!i_ex(obj_growtangle))
    {
        with (obj_heart)
            scr_afterimagefast();
        safe_delete(obj_heart);
        tilecon = 99;
    }
}
if (tilecon == 99)
{
    tilecon = 0;
    tiledone = 1;
    obj_board_controller.phase = 0;
}

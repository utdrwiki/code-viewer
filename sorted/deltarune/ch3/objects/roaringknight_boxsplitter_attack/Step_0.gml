local_turntimer--;
if (!init)
{
    if (difficulty == 0)
    {
        spawn_speed = 50;
    }
    else if (difficulty == 1)
    {
        spawn_speed = 46;
        force_swap = irandom(2) + 1;
    }
    else if (difficulty == 2)
    {
        spawn_speed = 31;
    }
    init = true;
    vertical = irandom(1);
}
if (!auto)
    exit;
if (knight == -4)
    knight = 344;
if (local_turntimer <= 30)
{
    if (local_turntimer <= 10 && sprite_index != spr_roaringknight_idle)
    {
        if (image_xscale < 0)
            x -= 220;
        image_xscale = abs(image_xscale);
        sprite_index = spr_roaringknight_idle;
        image_index = 0;
    }
    else if (local_turntimer < 22 && image_xscale < 0)
    {
        image_index = 4;
    }
    if (x < obj_knight_enemy.x)
        x++;
    var _local_turntimer = local_turntimer;
    if (_local_turntimer < 0)
        _local_turntimer = 0;
    y = lerp(y, knight.y, (50 - _local_turntimer) / 50);
    if (local_turntimer < 0 && obj_knight_split_growtangle.split == false)
    {
        global.turntimer = 0;
        instance_destroy();
    }
    exit;
}
timer++;
if (timer >= spawn_speed)
{
    timer = 0;
    vertical = irandom(1);
    if (difficulty == 0)
        vertical = force_oneside;
    var _xx = vertical ? 0 : 33;
    var _slash = instance_create(growtangle.x, growtangle.y, obj_roaringknight_splitslash);
    _slash.vertical = vertical;
    if (difficulty == 3)
    {
        _slash.diagonal = diagonal;
        if (diagonal)
        {
            timer = -4;
            diagonal = false;
        }
        else
        {
            diagonal = irandom(1);
        }
    }
    slash_count++;
    if (difficulty <= 2 && spawn_speed > 40)
        spawn_speed = scr_movetowards(spawn_speed, 40, 3);
    spawn_range = scr_approach(spawn_range, 60, 3);
}

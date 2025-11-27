local_turntimer--;
if (!auto)
    exit;
if (knight == -4)
    knight = 344;
if (local_turntimer <= 50)
{
    if (local_turntimer <= 10 && sprite_index != spr_roaringknight_idle)
    {
        if (image_xscale < 0)
            x -= 220;
        image_xscale = abs(image_xscale);
        sprite_index = spr_roaringknight_idle;
        image_index = 0;
    }
    else if (local_turntimer < 42 && image_xscale < 0)
    {
        image_index = 4;
    }
    if (x < obj_knight_enemy.x)
        x++;
    var _local_turntimer = local_turntimer;
    if (_local_turntimer < 0)
        _local_turntimer = 0;
    y = lerp(y, knight.y, (50 - _local_turntimer) / 50);
    if ((local_turntimer < -60 && turn_type != "short end") || (local_turntimer < -110 && turn_type == "short end"))
    {
        global.turntimer = 0;
        instance_destroy();
        exit;
    }
}
else if (recoil != 0)
{
    x += recoil;
    recoil = scr_movetowards(recoil, 0.25 * sign(recoil), 0.5);
}
if ((local_turntimer < 120 || (local_turntimer < 150 && next_up == 4)) && slash_count < 999 && (slash_count % 2) == 0 && !done)
{
    slash_count = 999;
    if (turn_type == "start" || turn_type == "short start" || turn_type == "short mid")
    {
        done = true;
        local_turntimer = 99999;
        slash_count = 1000;
        var new_knight = -4;
        switch (next_up)
        {
            case 5:
                new_knight = 1174;
                slash_count = 993;
                break;
            case 4:
                new_knight = 631;
                slash_count = 993;
                break;
            case 3:
                new_knight = 803;
                slash_count = 999;
                break;
            case 2:
                new_knight = 670;
                slash_count = 999;
                break;
        }
        next_up = -999;
        var knight_stream = instance_create(obj_knight_enemy.x - 100, obj_knight_enemy.y - 88, new_knight);
        scr_bullet_inherit(knight_stream);
        knight_stream.creatorid = creatorid;
        knight_stream.creator = creator;
        with (knight_stream)
        {
            if (new_knight == 631)
                x -= 50;
            else if (new_knight == 803)
                x += 25;
            else
                x += 50;
            y -= 44;
            turn_type = "end";
            if (new_knight != 1174)
            {
                with (instance_create_depth(x, y, depth, obj_knight_warp))
                {
                    master = other.id;
                    event_user(0);
                }
            }
            if (other.turn_segment == 0)
            {
                turn_type = "short mid";
                turn_segment = 1;
                next_up = other.next_next_up;
            }
            if (other.turn_segment == 1)
            {
                turn_type = "short end";
                turn_segment = 2;
                if (next_up == 4)
                    slash_count -= 4;
            }
            anchor_x = other.anchor_x;
            anchor_y = other.anchor_y;
            event_user(0);
            if (new_knight == 670)
                knight_stream.timer = 4;
            if (new_knight == 1174)
            {
                new_knight.alarm[0] = 1;
                new_knight.init_start = 3;
                new_knight.init = 4;
            }
        }
        exit;
    }
    slash_anim_count = 999;
    timer = -2;
}
if (slash_count > 999)
    exit;
if (slash_count == 999 && done)
    exit;
timer++;
if (timer >= spawn_speed)
{
    if (spawn_speed > 2)
        spawn_speed -= 2;
    slash_count++;
    timer = 0;
    if (slash_count == 1000)
    {
        instance_create(obj_growtangle.x + 33, obj_growtangle.y, obj_roaringknight_quickslash_big);
    }
    else
    {
        event_user(3);
        if (slash_count == 999)
            spawn_speed = 10;
    }
    spawn_range = scr_approach(spawn_range, 60, 3);
}

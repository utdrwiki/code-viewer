if (variablelocation == true)
{
    if (spawn_up == 0)
    {
        with (obj_board_enemySpawnLocation)
        {
            if (extflag == other.extflag)
            {
                if (dir == "up")
                    other.spawn_up = id;
            }
        }
    }
    if (spawn_down == 0)
    {
        with (obj_board_enemySpawnLocation)
        {
            if (extflag == other.extflag)
            {
                if (dir == "down")
                    other.spawn_down = id;
            }
        }
    }
    if (spawn_left == 0)
    {
        with (obj_board_enemySpawnLocation)
        {
            if (extflag == other.extflag)
            {
                if (dir == "left")
                    other.spawn_left = id;
            }
        }
    }
    if (spawn_right == 0)
    {
        with (obj_board_enemySpawnLocation)
        {
            if (extflag == other.extflag)
            {
                if (dir == "right")
                    other.spawn_right = id;
            }
        }
    }
}
if (active)
{
    if (!made && (global.flag[1022] == 0 || tennareq == 0))
    {
        if (!variablelocation)
        {
            chaser = instance_create(x, y, obj_chaseenemy_board);
        }
        else
        {
            var targetLoc = 0;
            if (obj_board_camera.shift == "up")
                targetLoc = spawn_down;
            if (obj_board_camera.shift == "down")
                targetLoc = spawn_up;
            if (obj_board_camera.shift == "left")
                targetLoc = spawn_right;
            if (obj_board_camera.shift == "right")
                targetLoc = spawn_left;
            if (i_ex(targetLoc))
            {
                chaser = instance_create(targetLoc.x, targetLoc.y, obj_chaseenemy_board);
            }
            else
            {
                chaser = instance_create(x, y, obj_chaseenemy_board);
                debug_message("targetloc not found");
            }
        }
        chaser.encounterno = encounterno;
        chaser.chaseflag = chaseflag;
        chaser.encounterflag = encounterflag;
        chaser.daddy = id;
        chaser.tennareq = tennareq;
        made = true;
    }
}
else if (made)
{
    safe_delete(chaser);
    made = false;
}

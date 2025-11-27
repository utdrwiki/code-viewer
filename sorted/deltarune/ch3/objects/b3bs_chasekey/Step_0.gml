scr_depth_board();
sndbuff--;
stuckbuff--;
if (!grabbed)
{
    if (init == 0)
    {
        pointCount = instance_number(pointObj);
        for (var i = 0; i < pointCount; i++)
            myPoint[i] = instance_find(pointObj, i);
        init = 1;
    }
    if (moveCon == 0)
    {
        playerDistanceThreshold = 128;
        if (i_ex(playerObj))
        {
            if (point_distance(x, y, playerObj.x, playerObj.y) < playerDistanceThreshold)
                moveCon = 1;
        }
    }
    if (moveCon == 1 && i_ex(playerObj))
    {
        playerFurthestPoint = 0;
        var playerFurthestPointDistance = 0;
        meFurthestPoint = 0;
        var meFurthestPointDistance = 0;
        for (var i = 0; i < pointCount; i++)
        {
            var checkDist = point_distance(myPoint[i].x, myPoint[i].y, playerObj.x, playerObj.y);
            var checkDistMe = point_distance(myPoint[i].x, myPoint[i].y, x, y);
            if (checkDistMe < checkDist)
            {
                if (checkDist > playerFurthestPointDistance)
                {
                    playerFurthestPointDistance = checkDist;
                    playerFurthestPoint = i;
                }
            }
        }
        moveCon = 2;
        moveTimer = 0;
        samePlaceCount = 0;
        previousXPrevious = 9999;
        previousYPrevious = 9999;
    }
    if (moveCon == 2)
    {
        var xx = myPoint[playerFurthestPoint].x;
        var yy = myPoint[playerFurthestPoint].y;
        var mySpeed = 8;
        if (global.flag[1055] > 0)
            mySpeed = 6;
        if (stuckcount >= 2)
            mySpeed = 6;
        if (stuckcount >= 6)
            mySpeed = 4;
        if (point_distance(x, y, xx, yy) < (mySpeed + 2) || moveTimer > 32)
        {
            moveCon = 0;
        }
        else
        {
            var myDir = round(point_direction(x, y, xx, yy) / 90) * 90;
            for (var i = 0; i < 3; i++)
            {
                moveX[i] = lengthdir_x(mySpeed, (myDir - 90) + (90 * i));
                moveY[i] = lengthdir_y(mySpeed, (myDir - 90) + (90 * i));
                if (!place_meeting(x + moveX[i], y + moveY[i], solidObj))
                    canMove[i] = 1;
                else
                    canMove[i] = 0;
            }
            var finalMoveX = 0;
            var finalMoveY = 0;
            if (canMove[1] == 1)
            {
                finalMoveX = moveX[1];
                finalMoveY = moveY[1];
            }
            else if (moveClockwise == 1)
            {
                if (canMove[2])
                {
                    finalMoveX = moveX[2];
                    finalMoveY = moveY[2];
                }
                else
                {
                    moveClockwise = 0;
                }
            }
            else if (moveClockwise == 0)
            {
                if (canMove[0])
                {
                    finalMoveX = moveX[0];
                    finalMoveY = moveY[0];
                }
                else
                {
                    moveClockwise = 1;
                }
            }
            x += finalMoveX;
            y += finalMoveY;
            moveTimer++;
            if (moveTimer >= 0)
            {
                if (previousXPrevious == x && previousYPrevious == y)
                {
                    moveTimer = 999;
                    if (stuckbuff <= 0)
                    {
                        debug_print("stucks?");
                        stuckbuff = 30;
                        stuckcount++;
                        debug_message(stuckcount);
                    }
                    if (sndbuff <= 0)
                    {
                        snd_stop(snd_board_kill_ominous);
                        snd_play_x(snd_board_kill_ominous, 0.35, 1.4 + random(0.2));
                        sndcount++;
                        if (sndcount >= 3)
                        {
                            sndcount = 0;
                            sndbuff = 10;
                        }
                    }
                    x -= finalMoveX;
                    y -= finalMoveY;
                }
            }
            previousXPrevious = xprevious;
            previousYPrevious = yprevious;
        }
    }
    if (place_meeting(x, y, obj_board_swordhitbox))
    {
        instance_create(x, y, obj_board_enemydefeatsplash);
        global.flag[1255]++;
        instance_destroy();
    }
}

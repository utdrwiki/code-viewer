event_inherited();
dir = 2;
prefdir = "left";
enabled = true;
neutralcon = 0;
waittime = 0;
waittimer = irandom_range(0, 30);
updwait = -1;
ignoreblocked = false;
movetime = 12;
movetimer = 0;
updmove = -1;
safex = x;
safey = y;
depth = 30075;
init = 0;
movetype = 0;
influenceable = true;
homedistance = 120;
lastdir = -1;
failmovecount = 0;
failmovethresh = 4;
movevistype = 0;
angle = 0;
dodraw = true;
sprite_index = spr_climb_chaseenemy_40;
flashadjustmentx = 20;
flashadjustmenty = 20;
effectadjustmentx = 20;
effectadjustmenty = 20;
if (i_ex(obj_rotating_tower_controller_new))
{
    dodraw = false;
    if (obj_rotating_tower_controller_new.appearance == 1)
    {
        sprite_index = spr_climb_chaseenemy_40;
        x -= 40;
        flashadjustmentx = -20;
        flashadjustmenty = 20;
        effectadjustmentx = 20;
        effectadjustmenty = 20;
    }
    else
    {
        sprite_index = spr_climb_chaseenemy_40;
        flashadjustmentx = -100;
        flashadjustmenty = 20;
        effectadjustmentx = -60;
        effectadjustmenty = 20;
    }
}
if (room == room_dw_churchb_darkclimb)
    target = 0;

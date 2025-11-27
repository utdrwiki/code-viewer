event_inherited();
if (init == 0)
{
    if (r_spawntimer != -1)
        spawntimer = r_spawntimer;
    if (r_spawnrate != -1)
        spawnrate = r_spawnrate;
    if (r_spawncap != -1)
        spawncap = r_spawncap;
    if (r_spawntype != -1)
        spawntype = r_spawntype;
    if (r_spawndir != -1)
        spawndir = r_spawndir;
    if (r_rotspawn != -1)
        rotspawn = r_rotspawn;
    init = 1;
}
var camy = cameray();
if (y < (camy - lenience) || y > (camy + 480 + 200))
    exit;
spawntimer++;
if (spawntimer >= spawnrate)
{
    var spawnobj = 1341;
    if (spawntype == 0 || spawntype == 1 || spawntype == 2)
        spawnobj = 990;
    var moveenemy = false;
    var makeenemy = false;
    if (instance_number(spawnobj) < spawncap)
        makeenemy = true;
    var xx = floor((x + 20) / 40) * 40;
    var yy = floor(y / 40) * 40;
    if (rotspawn)
    {
        if (rotspawn == 1)
            spawndir++;
        if (rotspawn == 2)
            spawndir--;
        if (spawndir < 0)
            spawndir = 3;
        if (spawndir > 3)
            spawndir = 0;
        for (var i = 0; i < 4; i++)
        {
            if (makeenemy)
            {
                if (!moveenemy)
                {
                    var spawndircheck = spawndir + i;
                    if (spawndircheck > 3)
                        spawndircheck = 0;
                    if (spawndircheck < 0)
                        spawndircheck = 3;
                    px = 0;
                    py = 0;
                    if (spawndircheck == 0)
                        py = 40;
                    if (spawndircheck == 1)
                        px = 40;
                    if (spawndircheck == 2)
                        py = -40;
                    if (spawndircheck == 3)
                        px = -40;
                    if (place_meeting(xx + px, yy + py, obj_climb_climbable) || place_meeting(xx + px, yy + py, obj_climb_pathturner))
                    {
                        if (!place_meeting(xx + px, yy + py, obj_climb_enemy))
                        {
                            spawndir = spawndircheck;
                            moveenemy = true;
                            makeenemy = true;
                        }
                    }
                }
            }
        }
    }
    var px = 0;
    var py = 0;
    if (spawndir == 0)
        py = 40;
    else if (spawndir == 1)
        px = 40;
    else if (spawndir == 2)
        py = -40;
    else if (spawndir == 3)
        px = -40;
    if (!moveenemy)
    {
        if ((place_meeting(xx + px, yy + py, obj_climb_climbable) || place_meeting(xx + px, yy + py, obj_climb_pathturner)) && !place_meeting(xx + px, yy + py, obj_climb_enemy))
            moveenemy = true;
        else
            makeenemy = false;
    }
    if (makeenemy)
    {
        var offset = 0;
        if (i_ex(obj_rotating_tower_controller_new))
            offset = -40;
        var enemy = instance_create(xx, yy, spawnobj);
        enemy.image_alpha = 0;
        scr_lerp_var_instance(enemy, "image_alpha", 0, 1, 15, 1, "out");
        with (enemy)
        {
            ignoreblocked = true;
            if (spawnobj == 990)
            {
                if (other.spawntype == 0)
                {
                }
                if (other.spawntype == 1)
                {
                    movetype = 1;
                    waittime = 15;
                    movetime = 15;
                }
                if (other.spawntype == 2)
                {
                    movetype = 2;
                    waittime = 10;
                    movetime = 15;
                }
                if (!i_ex(obj_rotating_tower_controller_new))
                {
                    scr_lerpvar("x", xx + offset, xx + px + offset, 8, 2, "in");
                    scr_lerpvar("y", yy, yy + py, 8, 2, "in");
                }
                dir = other.spawndir;
                angle = 360 + (other.spawndir * -90);
                waittimer = -10;
            }
        }
        spawntimer = 0;
    }
    else
    {
        spawntimer = spawnrate - 1;
    }
    if (updcap != -1)
    {
        spawncap = updcap;
        updcap = -1;
    }
    if (updrate != -1)
    {
        spawnrate = updrate;
        updrate = -1;
    }
}

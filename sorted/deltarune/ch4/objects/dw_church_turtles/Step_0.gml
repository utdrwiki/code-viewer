scr_populatechars();
if (shadowinit == 0)
{
    instance_create(x, y, obj_darkness_overlay);
    with (instance_create(x, y, obj_floorshadow))
    {
        target = other.kris;
        name = "kris";
    }
    with (instance_create(x, y, obj_floorshadow))
    {
        target = other.ralsei;
        name = "ralsei";
    }
    with (instance_create(x, y, obj_floorshadow))
    {
        target = other.susie;
        name = "susie";
    }
    if (i_ex(gerson))
    {
        with (instance_create(x, y, obj_floorshadow))
        {
            target = other.gerson;
            name = "gerson";
        }
    }
    shadowinit = 1;
}
if (global.plot >= 140)
{
    with (obj_doorAny)
    {
        if (init == 1)
        {
            if (doorRoom == room_dw_church_ripplepuzzle)
            {
                doorRoom = room_dw_church_ripplepuzzle_postgers;
                if (global.plot == 141)
                    instance_destroy();
            }
            init = 2;
        }
    }
}
if (global.plot == 141)
{
    if (leavecon == 0)
    {
        if (kris.x > 1232 && global.interact == 0)
        {
            kris.x = 1232;
            leavecon = 1;
            scr_speaker("ralsei");
            msgsetloc(0, "\\EK* I think we should stay with the old man./%", "obj_dw_church_turtles_slash_Step_0_gml_60_0");
            global.interact = 1;
            d_make();
            with (instance_create(obj_mainchara.bbox_right + 4, obj_mainchara.y, obj_solidblocksized))
                scr_size(8, 8);
        }
    }
    if (leavecon == 1 && !d_ex())
    {
        global.interact = 0;
        leavecon = 5;
    }
}
if (global.fighting == 1)
    domake = false;
array_push(plspeed, obj_mainchara.px);
if (array_length(plspeed) > 8)
    array_delete(plspeed, 0, 1);
var plspeedavg = 0;
for (var i = 0; i < array_length(plspeed); i++)
    plspeedavg += plspeed[i];
plspeedavg = plspeedavg / array_length(plspeed);
if (battlecon == 0 && domake)
{
    var trig = 0;
    var _dir = 0;
    var difficulty = 0;
    if (global.flag[encounterflag] != 0)
        difficulty = 1;
    with (obj_trigger)
    {
        if (place_meeting(x, y, obj_mainchara))
        {
            trig = 1;
            if (obj_mainchara.x < (bbox_left + (sprite_width / 2)))
                _dir = 0;
            else
                _dir = 1;
        }
    }
    if (trig == 1)
    {
        debug_print("difficulty=" + string(difficulty));
        if (difficulty == 1)
            _dir = !_dir;
        var xloc = scr_genmarker("right").x;
        if (_dir == 1)
            xloc = scr_genmarker("left").x;
        with (instance_create(xloc, cameray(), obj_encounter_incenseturtle))
        {
            dir = _dir;
            encounterno = other.encounterno;
            encounterflag = other.encounterflag;
        }
        battletimer = 200;
        battlecon = 1;
    }
}
if (battlecon == 1)
{
    if (global.interact == 0)
        battletimer--;
    if (battletimer <= 0)
        battlecon = 0;
}

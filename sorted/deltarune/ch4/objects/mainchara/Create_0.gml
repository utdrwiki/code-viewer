scr_depth();
global.currentroom = room;
scr_initialize_charnames();
autorun = 0;
bg = 0;
if (instance_exists(obj_backgrounderparent))
    bg = 1;
stepping = 0;
stepped = 0;
drawbattlemode = 1;
battlemode = 0;
battleheart = instance_create(x, y, obj_overworldheart);
battleheart.image_alpha = 0;
battleheart.image_speed = 0;
battlealpha = 0;
becamebattle = 0;
sliding = 0;
becamesword = 0;
swordmode = 0;
swordcon = 0;
swordtimer = 0;
stop_movement = 0;
roomenterfreezeend = 0;
climbing = 0;
climbbuffer = 0;
floorheight = 0;
darkmode = global.darkzone;
if (darkmode == 1)
{
    stepping = 1;
    image_xscale = 2;
    image_yscale = 2;
}
cutscene = 0;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
px = 0;
py = 0;
wallcheck = 0;
wspeed = 3;
bwspeed = 3;
if (darkmode == 1)
{
    bwspeed = 4;
    wspeed = 4;
}
run = 0;
runtimer = 0;
runcounter = 0;
drawdebug = 0;
ignoredepth = 0;
freeze = 0;
subxspeed = 0;
subyspeed = 0;
subx = 0;
suby = 0;
walkanim = 0;
walkbuffer = 0;
walktimer = 0;
image_speed = 0;
dsprite = spr_krisd;
rsprite = spr_krisr;
usprite = spr_krisu;
lsprite = spr_krisl;
climbsprite = 3708;
if (global.darkzone == 1)
{
    dsprite = spr_krisd_dark;
    rsprite = spr_krisr_dark;
    lsprite = spr_krisl_dark;
    usprite = spr_krisu_dark;
}
init_clothes = false;
if (global.chapter == 4)
{
    if (global.darkzone == 0 && global.plot >= 11 && global.plot < 35)
    {
        init_clothes = true;
        dsprite = spr_kris_walk_down_church;
        rsprite = spr_kris_walk_right_church;
        lsprite = spr_kris_walk_left_church;
    }
    tower_shake_xoffset = 0;
}
swordfacing = 1;
swordsprite = rsprite;
fun = 0;
if (global.facing == 0)
    sprite_index = dsprite;
if (global.facing == 1)
    sprite_index = rsprite;
if (global.facing == 2)
    sprite_index = usprite;
if (global.facing == 3)
    sprite_index = lsprite;
onebuffer = 0;
twobuffer = 0;
threebuffer = 0;
global.menuno = 0;
for (i = 0; i < 10; i += 1)
    global.menucoord[i] = 0;
cameFromEntrance = global.entrance;
if (global.interact == 3)
{
    noentrancefound = 0;
    if (global.entrance > 0)
    {
        if (global.flag[21] <= 0)
        {
            global.interact = 0;
            global.flag[21] = -10;
            roomenterfreezeend = 1;
        }
        switch (global.entrance)
        {
            case 1:
                if (i_ex(obj_markerA))
                    setxy(obj_markerA.x, obj_markerA.y);
                else
                    noentrancefound = 1;
                break;
            case 2:
                if (i_ex(obj_markerB))
                    setxy(obj_markerB.x, obj_markerB.y);
                else
                    noentrancefound = 1;
                break;
            case 3:
                if (i_ex(obj_markerC))
                    setxy(obj_markerC.x, obj_markerC.y);
                else
                    noentrancefound = 1;
                break;
            case 4:
                if (i_ex(obj_markerD))
                    setxy(obj_markerD.x, obj_markerD.y);
                else
                    noentrancefound = 1;
                break;
            case 5:
                if (i_ex(obj_markerE))
                    setxy(obj_markerE.x, obj_markerE.y);
                else
                    noentrancefound = 1;
                break;
            case 6:
                if (i_ex(obj_markerF))
                    setxy(obj_markerF.x, obj_markerF.y);
                else
                    noentrancefound = 1;
                break;
            case 18:
                if (i_ex(obj_markerr))
                    setxy(obj_markerr.x, obj_markerr.y);
                else
                    noentrancefound = 1;
                break;
            case 19:
                if (i_ex(obj_markers))
                    setxy(obj_markers.x, obj_markers.y);
                else
                    noentrancefound = 1;
                break;
            case 20:
                if (i_ex(obj_markert))
                    setxy(obj_markert.x, obj_markert.y);
                else
                    noentrancefound = 1;
                break;
            case 21:
                if (i_ex(obj_markeru))
                    setxy(obj_markeru.x, obj_markeru.y);
                else
                    noentrancefound = 1;
                break;
            case 22:
                if (i_ex(obj_markerv))
                    setxy(obj_markerv.x, obj_markerv.y);
                else
                    noentrancefound = 1;
                break;
            case 23:
                if (i_ex(obj_markerw))
                    setxy(obj_markerw.x, obj_markerw.y);
                else
                    noentrancefound = 1;
                break;
            case 24:
                if (i_ex(obj_markerX))
                    setxy(obj_markerX.x, obj_markerX.y);
                else
                    noentrancefound = 1;
                break;
            default:
                noentrancefound = 1;
        }
        if (noentrancefound == 1)
        {
            if (i_ex(obj_markerAny))
            {
                with (obj_markerAny)
                {
                    if (image_index == global.entrance)
                    {
                        other.x = x;
                        other.y = y;
                    }
                }
            }
            else
            {
                setxy(room_width / 2, room_height / 2);
                debug_message("entrance not found, setting to center of room");
                debug_message("entrance requested was global.entrance=" + string(global.entrance));
            }
        }
    }
}
initwd = sprite_width;
initht = sprite_height;
mywidth = sprite_width;
myheight = sprite_height;
for (i = 0; i < 3; i += 1)
    global.battledf[i] = global.df[global.char[i]] + global.itemdf[global.char[i]][0] + global.itemdf[global.char[i]][1] + global.itemdf[global.char[i]][2];
if (global.chapter == 2)
{
    if (global.flag[302] == 1)
        instance_create(x, y, obj_kris_headobj);
}
if (global.chapter == 4)
{
    if (!cameFromEntrance && room == room_dw_castle_town)
    {
        if (global.plot >= 240 && global.flag[1661] > 0)
        {
            x = 920;
            y = 1200;
        }
    }
}

function check_heightfloor(arg0, arg1, arg2)
{
    var __onfloor = 0;
    var __inst = instance_position(bbox_right + arg0, bbox_top + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    __inst = instance_position(bbox_right + arg0, bbox_bottom + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    __inst = instance_position(bbox_left + arg0, bbox_top + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    __inst = instance_position(bbox_left + arg0, bbox_bottom + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    if (__onfloor == 4)
        __onfloor = 1;
    else
        __onfloor = 0;
    return __onfloor;
}

nudgex = 0;
nudgey = 0;
nudgelerp = 0.1;
if (global.interact == 7)
{
    if (global.tempflag[93] == 1)
    {
        freeze = true;
        cutscene = true;
    }
    else
    {
        var found = 0;
        with (obj_climb_marker)
        {
            if (found == 0)
            {
                if (image_index == global.entrance)
                {
                    found = 1;
                    with (instance_create(x + 20, y + 20, obj_climb_kris))
                    {
                        var roomw = room_width;
                        var roomh = room_height;
                        var vieww = view_wport[0];
                        var viewh = view_hport[0];
                        var camx = clamp(x - floor(vieww / 2), 0, roomw - vieww);
                        var camy = clamp(y - floor(viewh / 2), 0, roomh - viewh);
                        var lclamp = 0;
                        var rclamp = roomw - vieww;
                        var uclamp = 0;
                        var dclamp = roomh - viewh;
                        camx = clamp(camx, lclamp, rclamp);
                        camy = clamp(camy, uclamp, dclamp);
                        camerax_set(camx);
                        cameray_set(camy);
                        startofroom = true;
                    }
                    global.interact = 0;
                }
            }
        }
        if (found)
        {
            visible = false;
            freeze = true;
            cutscene = true;
        }
    }
}
noclip = false;
if (scr_debug())
{
    if (layer_exists("OBJECTS_MAIN"))
    {
        if (!layer_get_visible("OBJECTS_MAIN"))
        {
            debug_message("OBJECTS_MAIN layer is disabled in room: " + room_get_name(room));
            layer_set_visible("OBJECTS_MAIN", true);
        }
    }
}

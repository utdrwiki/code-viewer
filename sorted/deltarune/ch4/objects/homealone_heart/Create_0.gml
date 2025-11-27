depth = 6000;
global.currentroom = room;
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
roomenterfreezeend = 0;
climbing = 0;
climbbuffer = 0;
floorheight = 0;
darkmode = global.darkzone;
cutscene = 0;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
px = 0;
py = 0;
wallcheck = 0;
wspeed = 2;
bwspeed = 2;
if (room == room_lw_noellehouse_dess)
{
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
dsprite = spr_heartsmall;
rsprite = spr_heartsmall;
usprite = spr_heartsmall;
lsprite = spr_heartsmall;
climbsprite = 3708;
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
initwd = sprite_width;
initht = sprite_height;
mywidth = sprite_width;
myheight = sprite_height;
interactedobject = -4;
interacted = false;
interacting = false;
pushing_object = false;
air_offset_x = 0;
air_offset_y = 0;
angel_mode = false;
shake = false;
shake_x_offset = 0;
shake_y_offset = 0;
shake_timer = 0;

scr_depth_ch1()
alarm[2] = 2
global.currentroom = room
autorun = 0
bg = 0
if instance_exists(obj_backgrounderparent_ch1)
    bg = 1
stepping = 0
stepped = false
battlemode = 0
battleheart = instance_create_ch1(x, y, obj_overworldheart_ch1)
battleheart.image_alpha = 0
battleheart.image_speed = 0
battlealpha = 0
becamebattle = false
darkmode = global.darkzone
if (darkmode == true)
{
    stepping = 1
    image_xscale = 2
    image_yscale = 2
}
cutscene = false
press_l = 0
press_r = 0
press_d = 0
press_u = 0
px = 0
py = 0
wallcheck = 0
wspeed = 3
bwspeed = 3
if (darkmode == true)
{
    bwspeed = 4
    wspeed = 4
}
run = 0
runtimer = 0
subxspeed = 0
subyspeed = 0
subx = 0
suby = 0
walkanim = 0
walkbuffer = 0
walktimer = 0
image_speed = 0
dsprite = spr_krisd_ch1
rsprite = spr_krisr_ch1
usprite = spr_krisu_ch1
lsprite = spr_krisl_ch1
if (global.darkzone == true)
{
    dsprite = spr_krisd_dark_ch1
    rsprite = spr_krisr_dark_ch1
    lsprite = spr_krisl_dark_ch1
    usprite = spr_krisu_dark_ch1
}
fun = false
if (global.facing == 0)
    sprite_index = dsprite
if (global.facing == 1)
    sprite_index = rsprite
if (global.facing == 2)
    sprite_index = usprite
if (global.facing == 3)
    sprite_index = lsprite
onebuffer = 0
twobuffer = 0
threebuffer = 0
global.menuno = 0
for (i = 0; i < 10; i += 1)
    global.menucoord[i] = 0
if (global.interact == 3)
{
    if (global.entrance > 0)
    {
        global.interact = 0
        if (global.entrance == 1)
        {
            x = obj_markerA_ch1.x
            y = obj_markerA_ch1.y
        }
        if (global.entrance == 2)
        {
            x = obj_markerB_ch1.x
            y = obj_markerB_ch1.y
        }
        if (global.entrance == 4)
        {
            x = obj_markerC_ch1.x
            y = obj_markerC_ch1.y
        }
        if (global.entrance == 5)
        {
            x = obj_markerD_ch1.x
            y = obj_markerD_ch1.y
        }
        if (global.entrance == 6)
        {
            x = obj_markerE_ch1.x
            y = obj_markerE_ch1.y
        }
        if (global.entrance == 7)
        {
            x = obj_markerF_ch1.x
            y = obj_markerF_ch1.y
        }
        if (global.entrance == 18)
        {
            x = obj_markerr_ch1.x
            y = obj_markerr_ch1.y
        }
        if (global.entrance == 19)
        {
            x = obj_markers_ch1.x
            y = obj_markers_ch1.y
        }
        if (global.entrance == 20)
        {
            x = obj_markert_ch1.x
            y = obj_markert_ch1.y
        }
        if (global.entrance == 21)
        {
            x = obj_markeru_ch1.x
            y = obj_markeru_ch1.y
        }
        if (global.entrance == 22)
        {
            x = obj_markerv_ch1.x
            y = obj_markerv_ch1.y
        }
        if (global.entrance == 23)
        {
            x = obj_markerw_ch1.x
            y = obj_markerw_ch1.y
        }
        if (global.entrance == 24)
        {
            x = obj_markerX_ch1.x
            y = obj_markerX_ch1.y
        }
    }
}
initwd = sprite_width
initht = sprite_height
mywidth = sprite_width
myheight = sprite_height
for (i = 0; i < 3; i += 1)
    global.battledf[i] = (((global.df[global.char[i]] + global.itemdf[global.char[i]][0]) + global.itemdf[global.char[i]][1]) + global.itemdf[global.char[i]][2])
menuOpened = false

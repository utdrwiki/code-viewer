event_inherited();
image_alpha = 0;
if (scr_debug())
    image_alpha = 0.1;
image_speed = 0;
depth = 500;
con = 0;
timer = 0;
difficulty = 0;
canuse = true;
canceltimer = 0;
instructionLerp = 0;
canceltime = 15;
buffer = 0;
kris = 0;
ralsei = 0;
susie = 0;
siner = 0;
camx = -1;
camy = -1;
kr_x = x;
kr_y = y;
drawx = x;
drawy = y;
drawspace = 30;
alpha = 0;
solution = "777335";
progress = "";
freeplay = false;
cantuse = false;
solved = false;
catafollow = true;
forceend = 0;
notesplayed = false;
dontdrawmenu = false;
if (room == room_dw_church_intropiano)
{
    solution = "131315";
    kr_x = x + 12;
    kr_y = y;
    camx = 735;
    camy = 18;
}
if (room == room_dw_church_darkmaze)
{
    if (global.plot <= 150)
        catafollow = false;
    solution = "77331157";
    kr_x = x + 12;
    kr_y = y - 38;
    camx = 1551;
    camy = 580;
}
if (room == room_dw_church_pianopuzzle)
{
    solution = "13153355";
    camx = 3;
    camy = 0;
}
camcon = 0;
camxoverride = camerax();
camyoverride = cameray();
soundtoplay = -1;
memvolume = 1;
resetlight = 0;
makeafterimage = 0;
instrument = 524;
engaged = false;
if (!instance_exists(obj_tutorial_text))
    instance_create(0, 0, obj_tutorial_text);
memlightk = -4;
memlightr = -4;
memlights = -4;
dontresetproperly = false;

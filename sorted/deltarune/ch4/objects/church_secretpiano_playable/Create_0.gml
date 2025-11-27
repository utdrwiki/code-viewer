mysolid = -4;
if (global.plot >= 242)
{
    instance_destroy();
    exit;
}
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
solution = scr_secretpianocombo();
progress = "";
freeplay = false;
cantuse = false;
solved = false;
catafollow = true;
forceend = 0;
notesplayed = false;
index = 0;
camcon = 0;
camxoverride = camerax();
camyoverride = cameray();
soundtoplay = -1;
memvolume = 1;
resetlight = 0;
indexlerper = 0;
makeafterimage = 0;
instrument = 524;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 2862)
    {
        pianomarker = scr_marker_fromasset(spritesArray[i]);
        scr_depth_alt(pianomarker);
    }
}
if (!i_ex(obj_tutorial_text))
    instance_create(x, y, obj_tutorial_text);
if (global.flag[1547])
    cantuse = true;

depth = 35000;
image_alpha = 0.8;
waterheight = 0;
moverate = 4;
movetimer = 0;
fallingtimer = 10;
tilecount = 0;
tilelimit = 12;
bad = 0;
damage = 0;
sndplayed = 0;
drawx = 0;
drawy = 0;
totaltimer = 0;
falldir = 0;
height = 40;
dodraw = true;
if (i_ex(obj_rotating_tower_controller_new) && i_ex(obj_rotating_tower_controller_new))
{
    if (i_ex(obj_climb_watergenerator))
        dodraw = obj_climb_watergenerator.dodraw;
}
waterinit = 0;
watertype = 0;
ending = false;
endy = y;
triggered = 0;
animindex = 0;

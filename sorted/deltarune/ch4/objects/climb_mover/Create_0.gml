con = 0;
timer = 0;
movedwithclimb = 0;
init = 0;
traveltime = -1;
travelstyle = 0;
stick = false;
waittime = 5;
reset = 0;
myclimb = instance_create(x, y, obj_climb_climbable);
trigtype = 0;
dodraw = true;
xprediction = 0;
yprediction = 0;
if (i_ex(obj_rotating_tower_controller_new))
    dodraw = false;

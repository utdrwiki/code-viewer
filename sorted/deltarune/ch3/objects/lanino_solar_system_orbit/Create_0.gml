scr_bullet_init();
grazepoints = 2;
orbit_distance = 0;
orbit_distancemax = 180;
orbit_angle = irandom(360);
orbit_direction = choose(-2, -1.5, 1.5, 2, 2.5, 2.5);
orbit_expansion = 5;
orbit_face = irandom(360);
opacity = 0.6;
width = 2;
scaler = 0.02;
maxscale = 3;
element = 5;
damage = 55;
target = obj_dbulletcontroller.target;
moon = -4;
moon2 = -4;
x1 = x;
y1 = y;
x2 = x + lengthdir_x(orbit_distance, orbit_angle);
y2 = y + lengthdir_y(orbit_distance, orbit_angle);
hratio = 1;
vratio = 1;
var var_change = random(0.4);
if (irandom(1))
{
    hratio += ((var_change * 0.5) + random(var_change * 0.5));
    vratio -= ((var_change * 0.5) + random(var_change * 0.5));
}
else
{
    vratio += ((var_change * 0.5) + random(var_change * 0.5));
    hratio -= ((var_change * 0.5) + random(var_change * 0.5));
}

image_angle = direction;
depth = obj_growtangle.depth - 1;
var _x = obj_shutta_photo_controller.secrettargetx;
var _y = obj_shutta_photo_controller.secrettargety;
timer++;
x = lerp(xstart, targetx, timer / timermax);
y = lerp(ystart, targety, timer / timermax);
if (timer == timermax)
{
    var dir = 180;
    var dir2 = 0;
    repeat (6)
    {
        dir2 = -15 + irandom(30);
        var dox = x + lengthdir_x(5, dir + dir2);
        var doy = y + lengthdir_y(5, dir + dir2);
        bullet = scr_fire_bullet(dox, doy, obj_shutta_reticle_bullet2, dir + dir2, 1, spr_smallbullet, false, id, depth);
        bullet.image_angle = dir + dir2;
        bullet.friction = -0.2;
        bullet.depth = obj_growtangle.depth - 2;
        bullet.image_xscale = 0.5;
        bullet.image_yscale = 0.5;
        dir += 60;
    }
    repeat (6)
    {
        dir2 = (point_direction(x, y, _x, _y) - 15) + irandom(30);
        var dox = x + lengthdir_x(5, dir2);
        var doy = y + lengthdir_y(5, dir2);
        bullet = scr_fire_bullet(dox, doy, obj_shutta_reticle_bullet2, dir2, 1, spr_smallbullet, false, id, depth);
        bullet.friction = -0.2;
        bullet.image_angle = dir2;
        bullet.depth = obj_growtangle.depth - 2;
        bullet.image_xscale = 0.5;
        bullet.image_yscale = 0.5;
        dir += 36;
    }
    instance_destroy();
}

var cx = camerax();
var cy = cameray();
timer = 0;
con = 0;
siner = 0;
recoveryplatform = instance_create(cx + (camerawidth() / 2), -100, obj_marker);
recoveryplatform.sprite_index = spr_recovery_platform;
recoveryplatform.image_xscale = 2;
recoveryplatform.image_yscale = 2;
glow = instance_create(cx + (camerawidth() / 2), -100, obj_marker);
glow.sprite_index = spr_recovery_platform_glow;
glow.image_xscale = 1.2;
glow.image_yscale = 1;
annoyingdog = instance_create(cx + (camerawidth() / 2), -100, obj_marker);
annoyingdog.sprite_index = spr_dog_stand;
annoyingdog.image_xscale = 2;
annoyingdog.image_yscale = 2;
annoyingdog.image_speed = 0;
annoyingdog.depth = recoveryplatform.depth + 1;
depth = annoyingdog.depth - 40;
platform_y = cy - 80;
whitealpha = 0;
alpha = 1;
smashtimer = 0;
textspd = 1;
textoffset = 0;
siner = 0;
dogspin = 0;
if (scr_debug())
{
    if (!instance_exists(obj_battleback))
    {
        con = 3;
        timer = 55;
    }
}

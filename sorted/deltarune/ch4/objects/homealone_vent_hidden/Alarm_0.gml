if (fadeout)
    exit;
fadeout = true;
global.interact = 1;
instance_create(0, 0, obj_fadeout);
alarm[1] = 14;

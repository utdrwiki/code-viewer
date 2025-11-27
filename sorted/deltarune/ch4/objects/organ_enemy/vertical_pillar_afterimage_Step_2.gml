image_alpha -= 0.05;
if (image_alpha < 0)
    instance_destroy();
if (global.turntimer < 2)
    instance_destroy();

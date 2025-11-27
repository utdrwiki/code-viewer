if (parentid == -1 || !i_ex(parentid))
    instance_destroy();
image_alpha -= fadeSpeed;
if (image_alpha < 0)
    instance_destroy();

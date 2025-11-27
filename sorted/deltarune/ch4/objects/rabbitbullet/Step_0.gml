if (!i_ex(obj_growtangle))
{
    instance_destroy();
    exit;
}
jumpsiner += 1;
if (image_alpha < 1 && active == 0)
    image_alpha += 0.1;
else
    active = 1;
bottomy = (obj_growtangle.y + (obj_growtangle.sprite_height / 2)) - 20;
jsine = sin(jumpsiner / jumpspeed) * jumpheight;
y = (bottomy + jsine) - jumpheight;
image_speed = 0;
image_index = 1;
if (jsine > 0)
    image_index = 2;
if (jsine > (jumpheight / 2))
    image_index = 0;
if (x <= (obj_growtangle.x - (obj_growtangle.sprite_width / 2) - 40))
    image_alpha -= 0.1;

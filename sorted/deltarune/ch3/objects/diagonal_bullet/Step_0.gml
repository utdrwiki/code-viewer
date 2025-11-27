timer++;
var a = clamp(abs(x - obj_growtangle.x) / 300, 0, 1);
var maxalpha = lerp(1.3, 0, a);
image_alpha = lerp(maxalpha, 0, abs(y - obj_growtangle.y) / 200);
if (timer > 260)
    instance_destroy();

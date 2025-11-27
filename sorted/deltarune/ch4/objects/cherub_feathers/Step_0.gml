if (speed < 5)
    friction = 0.2;
if (speed < 2)
    fallspeed = scr_movetowards(fallspeed, 1, 0.05);
y += fallspeed;
x += (sin(siner / 15) * (fallspeed / 2));
siner++;
image_angle = (-cos(siner / 15) * 30) + spin_offset;
if (spinner < 1)
{
    var _spinease = scr_ease_out(spinner, 2);
    spinner += 0.1;
    spin_offset = lerp(spin_start, 0, _spinease);
}
if (fallspeed == 1)
    lifetime--;
if (lifetime <= 0)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}

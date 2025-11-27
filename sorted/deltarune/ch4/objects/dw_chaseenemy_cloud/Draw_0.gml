var render_x = camerax();
var render_y = cameray();
var newlastx = last_jumped_x;
var d = depth;
draw_sprite_ext(spr_20px_white_gradient, 0, render_x + 640, y + 120, 640, 18, 180, c_black, 1);
draw_sprite_ext(spr_whitepixel, 0, render_x, y + 120, 640, cameraheight(), 0, c_black, 1);
for (var xx = 0; xx < hcount; xx++)
{
    var i = (floor(render_x * 0.025) + xx) % hcount;
    var ii = vcount - 1;
    while (ii >= 0)
    {
        with (guys[ii + (i * vcount)])
        {
            var basex = (render_x - (render_x % 40)) + (xx * 40) + xoffset;
            if (basex >= other.minx)
            {
                var phase = i + (0.001 * (current_time + xoffset + yoffset)) + sin(((i * i) + (ii * ii)) * 0.1);
                x = basex + (cos(phase) * 8);
                y = other.y + (ii * 40) + (sin(phase) * 8) + yoffset;
                visible = true;
                draw_self();
                visible = false;
            }
            if (other.con == 1 && xx == (other.hcount - 1))
            {
                if ((render_x + xx) <= (other.last_jumped_x - 32))
                {
                    newlastx = render_x + xx;
                    with (instance_create(x + 32, y, obj_dw_chaseenemy_cloud_jumper))
                    {
                        gravity = 0.25;
                        speed = 12;
                        depth = d + 40;
                        direction = 110 + random_range(25, -25);
                        image_angle = direction + 90;
                        sprite_index = other.sprite_index;
                        image_speed = 0.5;
                    }
                }
            }
        }
        ii--;
    }
}
last_jumped_x = newlastx;

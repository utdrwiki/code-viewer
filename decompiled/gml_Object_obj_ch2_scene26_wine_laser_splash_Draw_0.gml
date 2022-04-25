draw_set_color(0x1DE6B5)
draw_circle(x, y, radius, 0)
radius -= 0.25
if (radius <= 0)
    instance_destroy()

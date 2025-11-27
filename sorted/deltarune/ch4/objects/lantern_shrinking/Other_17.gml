if (global.drawdimmerlight)
{
    draw_set_alpha(lightalpha);
    d_circle(x - camerax(), y - cameray(), size + (sin(siner / 30) * 4) + 4, false);
    draw_set_alpha(1);
}

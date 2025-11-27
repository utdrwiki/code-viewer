var litblue = 8112127;
if (view_current == 0)
{
    siner++;
    var alphtarg = 0;
    if (con == 1 || con == 40)
        alphtarg = 1;
    alpha = lerp(alpha, alphtarg, 0.2);
    drawspace = 18;
    var drawx = 318;
    var drawy = 138;
    draw_set_alpha(alpha * 0.7);
    d_circle_color(drawx, drawy, 44 + (sin(siner / 64) * 2), 0, 0, 0);
    draw_set_alpha(1);
    var sprangle = 0;
    var scale = 2;
    var spr = 2663;
    var circlespr = 4059;
    var arrowspr = 3799;
    var _space = 28;
    var sinstrength = 2;
    var basealpha = 0.35;
    var unit = [];
    array_push(unit, [3, 0, _space, 0, arrowspr]);
    array_push(unit, [5, _space, 0, 90, arrowspr]);
    array_push(unit, [7, 0, -_space, 180, arrowspr]);
    array_push(unit, [1, -_space, 0, 270, arrowspr]);
    array_push(unit, [0, 0, 0, 0, circlespr]);
    for (var i = 0; i < array_length(unit); i++)
    {
        var bonusalpha = 0;
        var xloc = drawx + unit[i][1];
        var yloc = drawy + unit[i][2] + (sin((siner + ((i + 1) * 42)) / 9) * sinstrength);
        if (soundtoplay == unit[i][0])
        {
            bonusalpha = 0.6;
            if (button1_p() && con == 1)
            {
                with (scr_marker_ext(xloc, yloc, unit[i][4], 2, 2, 0))
                {
                    image_blend = litblue;
                    var lifetime = 20;
                    depth = other.depth - 1;
                    image_angle = unit[i][3];
                    speed = 5;
                    friction = 0.35;
                    direction = image_angle - 90;
                    if (other.soundtoplay == 0)
                        speed = 0;
                    scr_lerpvar("image_alpha", 1, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
            }
        }
        draw_sprite_ext(unit[i][4], 0, xloc, yloc, 2, 2, unit[i][3], litblue, (basealpha + bonusalpha) * alpha);
    }
    if (scr_debug())
    {
        var count = 0;
        var space = 10;
        var border = 12;
    }
}

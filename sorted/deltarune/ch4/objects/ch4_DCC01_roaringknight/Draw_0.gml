if (state == 5)
{
    animsiner += 0.5;
    animalpha = clamp(animalpha + random_range(-0.1, 0.1), 0.6, 1);
    var animframe = animsiner;
    draw_sprite_ext(spr_roaring_knight_laugh_body, animframe * 0.3, x + random_range(-1, 1), y + random_range(-1, 1), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_roaring_knight_laugh_mouth, animframe * 0.7, x + random_range(-2, 2), y + random_range(-2, -5), 2, 2, 0, c_white, animalpha);
    for (var i = 1; i < 6; i++)
        draw_sprite_ext(spr_roaring_knight_laugh_mouth, animframe * 0.7, x + (sin(((animsiner * i) + (3.32 * i)) / 32) * 20 * i), y + (cos(((animsiner * i) + (i * 2.1 * i)) / 49) * 20 * i), 2, 2, 0, c_white, -0.3 + sin((animsiner + (i * 4)) / 4));
}
else
{
    draw_self();
}

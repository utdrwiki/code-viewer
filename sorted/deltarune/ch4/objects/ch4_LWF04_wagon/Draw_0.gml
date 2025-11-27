if (heartwagon == 1)
{
    draw_sprite(spr_wheelbarrow_parts_dark, 4, wagon_x + 5, wagon_y + 1);
    draw_sprite(spr_wheelbarrow_parts_dark, 3, (wagon_x + 5 + heartx + random(cageamt * 2)) - random(cageamt * 2), (wagon_y + 1 + hearty + random(cageamt * 2)) - random(cageamt * 2));
    draw_sprite(spr_wheelbarrow_parts_dark, 2, (wagon_x + 5 + random(cageamt)) - random(cageamt), (wagon_y + 1 + random(cageamt)) - random(cageamt));
    draw_sprite(spr_wheelbarrow_parts_dark, 1, wagon_x + 5, wagon_y + 1);
}

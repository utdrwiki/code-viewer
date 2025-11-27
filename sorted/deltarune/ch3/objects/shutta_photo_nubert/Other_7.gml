if (sprite_index == spr_npc_nubert_appear)
{
    sprite_index = spr_npc_nubert;
    image_speed = 0;
}
if (sprite_index == spr_npc_nubert_hide)
{
    x = camerax() + 150 + irandom(250);
    y = cameray() + 30 + irandom(200);
    if (con2 == 0)
    {
        x = camerax() + 150 + irandom(250);
        y = cameray() + irandom(100);
        con2 = 1;
    }
    else
    {
        x = camerax() + 150 + irandom(250);
        y = cameray() + 150 + irandom(50);
        con2 = 0;
    }
    sprite_index = spr_npc_nubert_appear;
    image_index = 0;
    image_speed = 0.5;
}

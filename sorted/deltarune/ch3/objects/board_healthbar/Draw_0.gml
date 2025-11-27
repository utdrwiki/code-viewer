if (init == 0 && i_ex(target))
{
    if (target.name == "kris")
        mycolor = hexcolor(#DBFC8F);
    if (target.name == "susie")
        mycolor = hexcolor(#EC95FB);
    if (target.name == "ralsei")
        mycolor = hexcolor(#1DE6B5);
    init = 1;
}
if (target == 0)
{
    if (index == 0)
    {
        with (obj_mainchara_board)
        {
            if (name == "kris")
                other.target = id;
        }
    }
    if (index == 1)
    {
        with (obj_mainchara_board)
        {
            if (name == "susie")
                other.target = id;
        }
    }
    if (index == 2)
    {
        with (obj_mainchara_board)
        {
            if (name == "ralsei")
                other.target = id;
        }
    }
}
var dead = 0;
if (target.myhealth <= 0)
    dead = true;
var healthamt = target.myhealth / target.maxhealth;
if (healthamt > 1)
    healthamt = 1;
draw_sprite_ext(sprite_index, dead, x, y, 2, 2, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_whitepx, 0, x + 14, y + 12, round(healthamt * 50), 6, image_angle, mycolor, image_alpha);

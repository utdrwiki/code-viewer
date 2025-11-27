if (headspeed > 0)
    headspeed -= headfriction;
if (headspeed < 0)
    headspeed += headfriction;
if (headoffsetx > 0)
    headspeed -= headgravity;
if (headoffsetx < 0)
    headspeed += headgravity;
if (headoffsetx > 34)
    headoffsetx = 34;
if (headoffsetx < -34)
    headoffsetx = -34;
if (headspeed > 15)
    headspeed = 15;
if (headspeed < -15)
    headspeed = -15;
headoffsetx += headspeed;
if (headoffsety > 0)
    headoffsety -= 0.5;
if (headoffsety < 0)
    headoffsety += 0.5;
draw_monster_body_part(spr_incense_idle, 1, x, y);
draw_monster_body_part(spr_incense_head, 0, x + 26 + headoffsetx, y + 56 + headoffsety);
if (headflashtimer > 0)
{
    headflashtimer--;
    d3d_set_fog(true, c_white, 0, 1);
    draw_monster_body_part(spr_incense_head, 0, x + 26 + headoffsetx, y + 56 + headoffsety);
    d3d_set_fog(false, c_white, 0, 0);
}
if (acting == 20)
{
    shakehead.x = x + 26 + headoffsetx;
    shakehead.y = y + 56 + headoffsety;
    shakehead.headflashtimer = headflashtimer;
    shakehead.visible = true;
}

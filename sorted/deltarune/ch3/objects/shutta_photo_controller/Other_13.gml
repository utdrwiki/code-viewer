var krisx = (obj_herokris.x - obj_herokris.sprite_xoffset) + (obj_herokris.sprite_width / 2);
var krisy = (obj_herokris.y - obj_herokris.sprite_yoffset) + (obj_herokris.sprite_height / 2);
var susiex = -1000;
var susiey = -1000;
if (i_ex(obj_herosusie))
{
    susiex = (obj_herosusie.x - obj_herosusie.sprite_xoffset) + (obj_herosusie.sprite_width / 2);
    susiey = (obj_herosusie.y - obj_herosusie.sprite_yoffset) + (obj_herosusie.sprite_height / 2);
}
var ralseix = -2000;
var ralseiy = -2000;
if (i_ex(obj_heroralsei))
{
    ralseix = (obj_heroralsei.x - obj_heroralsei.sprite_xoffset) + (obj_heroralsei.sprite_width / 2);
    ralseiy = (obj_heroralsei.y - obj_heroralsei.sprite_yoffset) + (obj_heroralsei.sprite_height / 2);
}
var krisdist = point_distance(x, y, krisx, krisy);
var susiedist = point_distance(x, y, susiex, susiey);
var ralseidist = point_distance(x, y, ralseix, ralseiy);
if (krisdist < susiedist && krisdist < ralseidist)
    closest_hero = "kris";
if (susiedist < krisdist && susiedist < ralseidist)
    closest_hero = "susie";
if (ralseidist < susiedist && ralseidist < krisdist)
    closest_hero = "ralsei";

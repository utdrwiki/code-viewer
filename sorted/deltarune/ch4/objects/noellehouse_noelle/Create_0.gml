var side_b = scr_sideb_active();
curtains_sprite = side_b ? 5236 : 1415;
curtain_marker = scr_marker(132, 62, curtains_sprite);
with (curtain_marker)
    scr_depth();
snowflake[0] = scr_marker(80, 60, spr_noellehouse_noelle_snowflakes_d);
snowflake[1] = scr_marker(88, 60, spr_noellehouse_noelle_snowflakes_c);
snowflake[2] = scr_marker(185, 60, spr_noellehouse_noelle_snowflakes_a);
snowflake[3] = scr_marker(196, 60, spr_noellehouse_noelle_snowflakes_d);
snowflake[4] = scr_marker(207, 60, spr_noellehouse_noelle_snowflakes_c);
snowflake[5] = scr_marker(218, 60, spr_noellehouse_noelle_snowflakes_b);
snowflake[6] = scr_marker(229, 60, spr_noellehouse_noelle_snowflakes_a);
for (var i = 0; i < array_length_1d(snowflake); i++)
{
    with (snowflake[i])
        scr_depth();
}
var bed_collider = instance_create(88, 155, obj_solidblock);
bed_collider.sprite_index = spr_homealone_sul_alt;
bed_collider = instance_create(97, 134, obj_solidblock);
bed_collider.sprite_index = spr_homealone_sul_alt;
var bed_readable = instance_create(48, 127, obj_readable_room1);
with (bed_readable)
{
    extflag = "bed";
    image_xscale = 2.6;
    image_yscale = 2.2;
}
var computer_readable = instance_create(51, 207, obj_readable_room1);
with (computer_readable)
{
    extflag = "computer";
    image_xscale = 1.7;
    image_yscale = 0.5;
}
var tv_readable = instance_create(116, 193, obj_readable_room1);
with (tv_readable)
{
    extflag = "tv";
    image_xscale = 2.5;
    image_yscale = 1;
}
var couch_readable = instance_create(122, 105, obj_readable_room1);
with (couch_readable)
{
    extflag = "couch";
    image_xscale = 5.45;
    image_yscale = 1.35;
}
var plant_readable = instance_create(177, 195, obj_readable_room1);
with (plant_readable)
    extflag = "plant";
var desk_readable = instance_create(258, 156, obj_readable_room1);
with (desk_readable)
{
    extflag = "desk";
    image_xscale = 1;
    image_yscale = 2.35;
}
var closet_readable = instance_create(246, 112, obj_readable_room1);
with (closet_readable)
{
    extflag = "closet";
    image_xscale = 1.3;
    image_yscale = 0.95;
}

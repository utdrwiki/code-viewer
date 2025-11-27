con = 0;
if (room == room_dw_teevie_intro)
{
    var count = 0;
    trig[count] = instance_create(x, y, obj_trigger_interact);
    with (trig[count])
    {
        setxy(40, 140);
        scr_sizeexact(80, 46);
        extflag = "intro_a";
        count++;
        strict = true;
    }
    trig[count] = instance_create(x, y, obj_trigger_interact);
    with (trig[count])
    {
        setxy(360, 140);
        scr_sizeexact(80, 46);
        extflag = "intro_b";
        count++;
        strict = true;
    }
    trig[count] = instance_create(x, y, obj_trigger_interact);
    with (trig[count])
    {
        setxy(680, 140);
        scr_sizeexact(80, 46);
        extflag = "intro_c";
        count++;
        strict = true;
    }
    trig[count] = instance_create(x, y, obj_trigger_interact);
    with (trig[count])
    {
        setxy(1920, 140);
        scr_sizeexact(80, 46);
        extflag = "intro_d";
        count++;
        strict = true;
    }
}
if (room == room_dw_teevie_large_01)
{
    trig[0] = instance_create(x, y, obj_trigger_interact);
    with (trig[0])
    {
        strict = true;
        setxy(920, 308);
        scr_sizeexact(80, 40);
        extflag = "large01_a";
    }
    trig[1] = instance_create(x, y, obj_trigger_interact);
    with (trig[1])
    {
        setxy(1040, 308);
        scr_sizeexact(80, 40);
        extflag = "large01_b";
        strict = true;
    }
    trig[2] = instance_create(x, y, obj_trigger_interact);
    with (trig[2])
    {
        setxy(1160, 308);
        scr_sizeexact(80, 40);
        extflag = "large01_c";
        strict = true;
    }
    trig[3] = instance_create(x, y, obj_trigger_interact);
    with (trig[3])
    {
        setxy(1600, 152);
        scr_sizeexact(80, 40);
        extflag = "large01_d";
        strict = true;
    }
}
if (room == room_dw_teevie_cowboy_zone_01_intro)
{
    trig[0] = instance_create(x, y, obj_trigger_interact);
    with (trig[0])
    {
        strict = true;
        setxy(40, 178);
        scr_sizeexact(80, 46);
        extflag = "cowboy_01";
    }
}
if (room == room_dw_teevie_cowboy_zone_02_intro)
{
    trig[0] = instance_create(x, y, obj_trigger_interact);
    with (trig[0])
    {
        strict = true;
        setxy(40, 178);
        scr_sizeexact(80, 46);
        extflag = "cowboy_02";
    }
}
if (room == room_dw_teevie_preview)
{
    var count = 0;
    trig[count] = instance_create(x, y, obj_trigger_interact);
    with (trig[count])
    {
        strict = true;
        setxy(640, 500);
        scr_sizeexact(80, 56);
        extflag = "teevieprev_a";
        count++;
    }
    trig[count] = instance_create(x, y, obj_trigger_interact);
    with (trig[count])
    {
        strict = true;
        setxy(960, 500);
        scr_sizeexact(80, 56);
        extflag = "teevieprev_b";
        count++;
    }
}
activetrig = -4;

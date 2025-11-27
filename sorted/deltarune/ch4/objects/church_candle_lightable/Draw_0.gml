extinguishTarget = 500;
if (room == room_dw_church_candlesroom1)
    extinguishTarget = 600;
siner++;
scaler = sin(siner / 10) * 1;
if (place_meeting(x, y, obj_candle_flamebullet))
{
    with (instance_place(x, y, obj_candle_flamebullet))
    {
        snd_play(snd_wing);
        instance_destroy();
    }
    lit = 1;
    timer = extinguishTarget;
}
if (lit == 1)
{
    timer--;
    if (timer == 0)
        lit = 0;
}
if (lit == 2)
    timer = lerp(timer, extinguishTarget, 0.25);
if (boss && lit < 2)
{
    var candlecount = 0;
    with (object_index)
    {
        if (lit != 0)
            candlecount++;
    }
    if (candlecount == instance_number(object_index))
    {
        safe_delete(door2blocker);
        layer_set_visible("TILES_DOOR2", 1);
        safe_delete(obj_candle_flamebullet);
        with (object_index)
            lit = 2;
        with (obj_church_candleLighter)
        {
            if (active == 1)
                active = 2;
        }
        global.flag[705] = 1;
        safe_delete(obj_overworld_bulletarea);
    }
}
if (lit == 0)
{
    mylight.x = room_width * 20;
    mylight.y = room_height * 20;
    mylight.smallerLight = 0;
    mylight.biggerLight = 0;
}
else
{
    mylight.x = x;
    mylight.y = y;
    mylight.smallerLight = ((timer / extinguishTarget) * 240) + (scaler * 4);
    mylight.biggerLight = ((timer / extinguishTarget) * 260) + (scaler * 3);
}
draw_self();

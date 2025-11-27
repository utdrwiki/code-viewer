sound_play_pitch(336, pitch);
with (obj_ghosthouse_dot)
    pitch += 0.1;
instance_destroy();
scr_tensionheal(2.5);
with (obj_event_manager)
    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_23, UnknownEnum.Value_939);

enum UnknownEnum
{
    Value_0,
    Value_23 = 23,
    Value_939 = 939
}

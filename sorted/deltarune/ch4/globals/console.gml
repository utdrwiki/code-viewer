function console()
{
    var _console = false;
    if (scr_debug())
    {
        with (obj_debugProfiler)
        {
            if (consolemode)
                _console = true;
        }
    }
    if (global.is_console)
        _console = true;
    return _console;
}

var max_channels = 1024
var fmod_flags = FMOD_INIT.NORMAL

fmod_system = fmod_system_create()
fmod_system_init(max_channels, fmod_flags)
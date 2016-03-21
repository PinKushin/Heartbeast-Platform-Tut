///ledge_grab_state
var up = keyboard_check_pressed (vk_space);
var down = keyboard_check_pressed (ord ("S"));

if down {
    state = move_state;
}
if up {
    state = move_state;
    vspd = -12;
}

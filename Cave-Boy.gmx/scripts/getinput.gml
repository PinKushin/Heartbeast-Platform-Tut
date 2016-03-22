///getinput()
//player control
right = keyboard_check (ord ("D"));
left = keyboard_check (ord ("A"));
up = keyboard_check_pressed (vk_space);
up_release = keyboard_check_released (vk_space);
down = keyboard_check_pressed (ord ("S"));
//overide controls for a gamepad
var gp_id = 0;
var thresh = 0.5;

if gamepad_is_connected(gp_id) {
    right = gamepad_axis_value (gp_id, gp_axislh) > thresh;
    left = gamepad_axis_value (gp_id, gp_axislh) < -thresh;
    up = gamepad_button_check_pressed (gp_id, gp_face1);
    up_release = gamepad_button_check_released (gp_id, gp_face1);
    down = gamepad_axis_value (gp_id, gp_axislv) > thresh;
}

///start_game()

socket_add_listener("button press", listener_playerbutton);
socket_add_listener("joystick", listener_playerjoystick);


room_goto(rm_game);

socket_emit("game start", "");

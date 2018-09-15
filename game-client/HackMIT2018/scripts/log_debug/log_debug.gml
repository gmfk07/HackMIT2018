///log_debug(string)
var message = argument0;
show_debug_message(message);
with (obj_debug) {
	ds_list_insert(obj_debug.debugMessages, 0, message);
}
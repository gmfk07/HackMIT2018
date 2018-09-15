/// @description  socket_get_queue()

// Get the event queue
var queue = json_decode(socket_get_queue_internal());

// Return a list of events within the queue ds_map
return queue[? "default"];

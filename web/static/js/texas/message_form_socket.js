import socket from "../socket"
let message_form = socket.channel("prop:message_form", {})
message_form.join()
export default message_form

import message_form from "./message_form_socket"
import $ from "jquery"
import h from 'virtual-dom/h'
import diff from 'virtual-dom/diff'
import patch from 'virtual-dom/patch'
import createElement from 'virtual-dom/create-element'
import VNode from 'virtual-dom/vnode/vnode'
import VText from 'virtual-dom/vnode/vtext'
import htmlToVdom from 'html-to-vdom'

$("[data-prop='message_form']").submit(function( event ) {
  event.preventDefault();
  message_form.push("prop:message_form", {query: $(event.target).serialize()});
});

var convertHTML = require('html-to-vdom')({ VNode: VNode, VText: VText });
var chatHtml = $("[data-prop='chat']")[0];
message_form.on('prop:message_form', function(message){
  var oldTree = convertHTML(chatHtml.outerHTML);
  var newHtml = message.message.split("\n").join("").trim();
  var newTree = convertHTML(newHtml);
  var changeset = diff(oldTree, newTree);
  chatHtml = patch(chatHtml, changeset);
  $("[data-prop='message_form']").unbind();
  $("[data-prop='message_form']").submit(function( event ) {
    event.preventDefault();
    message_form.push("prop:message_form", {query: $(event.target).serialize()});
  });
});
export default message_form


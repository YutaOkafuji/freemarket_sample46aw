# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Dropzone.autoDiscover = false

Dropzone.options.myAwesomeDropzone = {}

myDropzone = new Dropzone '.sell-content__upload-box--form', {url: 'items/new'}
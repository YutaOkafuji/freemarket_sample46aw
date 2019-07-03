# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Dropzone.autoDiscover = false

Dropzone.options.myAwesomeDropzone = {}

Dropzone.autoDiscover = false

new Dropzone '#exhibition-form',
  uploadMultiple: false
  paramName: 'attachment[image]'
  params:
    'attachment[item_id]': 1
  init: ->
    @on 'success', (file, json) ->
      # アップロード成功時の処理をここに実装します。
  dictDefaultMessage: '''
    <i class="fa fa-file-o fa-2x"></i><br>
    <br>
    ファイルをここにドロップするか<br>
    ここをクリックして下さい
  '''

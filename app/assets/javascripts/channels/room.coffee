# クライアントサイドの処理をするファイル

# ページのロード時に有効にするために必要
document.addEventListener 'turbolinks:load', ->

  App.room = App.cable.subscriptions.create "RoomChannel",
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#messages_index').append data['message']
      # alertを表示させる
      # alert data['message']
      # $('#messages_index').append(data['message']);

    speak: (message) ->
      @perform 'speak', message: message
      # speakの引数を"message"とする
      # @performメソッドでブラウザから入力されたデータをサーバーへ送信　メソッド名を"speak"で指定
    
    # returnキーでデータを受け取る
    # 'keypress' キーが押された時発火する
    $(document).on 'keypress', '[data-behavior~=room_speak]', (event) ->
    # key13= returnキー
      if event.keyCode is 13
        # event.target.valueは入力されたデータ
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()
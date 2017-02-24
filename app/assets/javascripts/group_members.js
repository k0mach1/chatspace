$(function(){

  // ユーザーを検索して結果のHTMLを追加する
  function searchUsers() {
    $.ajax('/users.json', {
      method: 'GET',
      data: {
        name: $('#user-search-field').val()
      },
      dataType: 'json',
      success: function(json) {
        insertHTML = '';
        json.forEach(function(user){
          insertHTML = "<div class='chat-group-user clearfix'>" +
                         "<p class='chat-group-user__name'>" +
                           user.name +
                         "</p>" +
                         "<a class='user-search-add chat-group-user__btn chat-group-user__btn--add' data-user-id='" + user.id + "' data-user-name='" + user.name + "'>追加</a>" +
                       "</div>";
        });
        $('#user-search-result').html(insertHTML);
      }
    });
  }
  // インクリメンタルサーチを実装
  $('#user-search-field').on('change keyup', searchUsers);

  // 検索した後で追加したユーザーのHTMLを追加
  $('#user-search-result').on('click', '.user-search-add', function(){
    var insertHTML = '<div class="chat-group-user clearfix" id="chat-group-user-'  + $(this).data('userId') + '">' +
                        '<input type="hidden" name="group[user_ids][]" value="' + $(this).data('userId') + '">' +
                        "<p class='chat-group-user__name'>" +
                          $(this).data('userName') +
                        "</p>" +
                        "<a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove' data-user-id='' + $(this).data('userId') + ''>削除</a>" +
                      "</div>";
    $('#chat-group-users').append(insertHTML);

    // 追加した後でボタンを消す
    $(this).parent('.chat-group-user').html("");
  });


  // ユーザーを消すやつ
  $('#chat-group-users').on('click', '.user-search-remove', function(){
    $('#chat-group-user-' + $(this).data('userId')).remove();
  })
});

$(function(){
  function buildHTML(comment){
    var html = `<div class="post_show_comments__area__list">
                  <p class="post_show_comments__area__list--name">
                    <a href="/users/${comment.user_id}">${comment.user_name}</a>
                  </p>
                  <p class="post_show_comments__area__list--comment">
                    ： ${comment.text}
                  </p>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.post_show_comments__area').append(html);
      $('#comment_text').val('');
      $('.msg-send-button').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})
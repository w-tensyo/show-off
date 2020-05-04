$(function(){

  // 子・孫共通で利用する
  function buildChildrenCategoryHTML(category){
    //子カテゴリーのoptionタグをここで生成。each処理で必要な分だけこの関数を呼び出して結合する予定
    // 注意：引数の設定などがまだできていない
    var html = `<option value="${category.id}">${category.name}</option>`
    return html;
  }
  // 子・孫共通で利用する（閉じタグ）
  function buildSelecterEndHTML(){
    var html=`</select>`
    return html;
  }

  // 子カテゴリーのプルダウンを作成
  function buildChildrenSelecterHTML(){
    //子カテゴリ、孫カテゴリを表示するためのselecterタグをここで生成
    var html = `<select class="post_create_content__form__selecter" name="post[category_id]" id="childrenSelecter">`
    return html;
  }

  // 孫カテゴリーのプルダウンを作成
  function buildGrandChildrenSelecterHTML(){
    //子カテゴリ、孫カテゴリを表示するためのselecterタグをここで生成
    var html = `<select class="post_create_content__form__selecter" name="post[category_id]" id="grandChildrenSelecter">`
    return html;
  }

  // プルダウン で変化があった場合に感知するイベント
  // 親カテゴリーのプルダウンに変更があった場合にこの処理を実行
  $('#parentSelecter').change(function(){

    // 処理を走らせる前に子カテゴリー(#childrenSelecter)を削除
    $('#childrenSelecter').remove();
    $('#grandChildrenSelecter').remove();
    // プルダンで選択した選択肢のidを、変数"category_id"に代入（ajax処理で利用するため）
    var category_id = $(this).val();
    // 送りたいアクションを変数"url"に代入してあげる
    var url = '/api/children_category'
    $.ajax({
      url: url,
      type: 'get',
      dataType: 'json',
      data: {id: category_id}
    }).done(function(children_category){
      var appendHtml = buildChildrenSelecterHTML();
      children_category.forEach(function(child_category){
        appendHtml += buildChildrenCategoryHTML(child_category);
      });
      appendHtml += buildSelecterEndHTML();
      $('#selectCategory').append(appendHtml);
    });
  });

  // 子カテゴリーのプルダウン に変化があった場合にこの処理を実行
  $(document).on('change','#childrenSelecter',function(){
    //処理を走らせる前に孫カテゴリ(#grandchildrenSelecter)を削除する
    $('#grandChildrenSelecter').remove();
    // プルダンで選択した選択肢のidを、変数"category_id"に代入（ajax処理で利用するため）
    var category_id = $(this).val();
    var url = '/api/children_category'
    $.ajax({
      url: url,
      type: 'get',
      dataType: 'json',
      data: {id: category_id}
    }).done(function(children_category){
      var appendHtml = buildGrandChildrenSelecterHTML();
      children_category.forEach(function(child_category){
        appendHtml += buildChildrenCategoryHTML(child_category);
      });
      appendHtml += buildSelecterEndHTML();
      $('#selectCategory').append(appendHtml);
    });
  });
});
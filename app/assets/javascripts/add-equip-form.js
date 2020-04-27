$(function(){
  $(document).ready(function() {
    const addEquipmentForm = (index)=> {
      var html = `
          <div class= "equipForm" data-equipment="${index}">
            <div class="post_create_content__form">
              <div class="post_create_content__form__upper">
                <label class="post_create_content__form__upper__name" for="post_gears_attributes_${index}_機材名">機材名(No.${index + 1})</label>
                <div class="post_create_content__form__upper--icon">
                  <div id="optional">任意</div>
                </div>
              </div>
              <input placeholder="品番、メーカーなど" class="post_create_content__form__under" type="text" name="post[gears_attributes][${index}][equipment]" id="post_gears_attributes_${index}_equipment">
            </div>
            <div class="post_create_content__form">
              <div class="post_create_content__form__upper" data-equ-comment="${index}">
                <label class="post_create_content__form__upper__name--sub" for="post_gears_attributes_${index}_機材詳細">機材詳細</label>
                <div class="post_create_content__form__upper--icon">
                  <div id="optional">任意</div>
                </div>
              </div>
              <input placeholder="機材についての詳細" class="post_create_content__form__under" type="text" name="post[gears_attributes][${index}][equ_comment]" id="post_gears_attributes_${index}_equ_comment">
            </div>
          </div>`
      return html;
    }

    let equIndex = [1,2,3,4,5,6,7,8,9,10];

    lastIndex = $('.equipForm').data('index');
    equIndex.splice(0, lastIndex);
    $('.hidden-destroy').hide();

    // 追加するボタンをクリックした時の処理
    $(document).on('click','#addEquipDetail',function(){
      $('#equipDetailListArea').append(addEquipmentForm(equIndex[0]));
      equIndex.shift();
      equIndex.push(equIndex[equIndex.length - 1] + 1)
    });

    $(document).on('click','#removeEquipDetail',function(){
      if($('.equipForm:last').data('equipment') == 0){
      }else{
        $('.equipForm:last').remove();
        equIndex.unshift(equIndex[0] - 1);
      }
    });
  });
});
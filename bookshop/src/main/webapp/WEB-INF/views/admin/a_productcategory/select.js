var $cateAll = $('#cateAll');
$cateAll.change(function () {
  var $this = $(this);
  var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
  // console.log(checked);
  $('input[name="categorys"]').prop('checked', checked);

});

var boxes = $('input[name="categorys"]');
boxes.change(function () {
  // 첫 번째 방법
  /*
  var selectAll = true;
  var count = boxes.length;
  var i = 0;
  for (; i < count; i++) {
    if (!boxes[i].checked) {
      selectAll = false;
      break;
    }
  }
  */

  // 두 번째 방법
  var boxLength = boxes.length;
  // 체크된 체크박스 갯수를 확인하기 위해 :checked 필터를 사용하여 체크박스만 선택한 후 length 프로퍼티를 확인
  var checkedLength = $('input[name="categorys"]:checked').length;
  var selectAll = (boxLength == checkedLength);

  $cateAll.prop('checked', selectAll);

});
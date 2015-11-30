//현 페이지 안에 있는 체크박스 전체 체크
$(document).ready(function(){
	$("#checkAll").on("click", function(){
		// #allCheck가 체크되면
		if($("#checkAll").prop("checked")){
			// input 태그의 name 속성이 checkbox인 녀석들에게 전부 checked 속성을 추가
			$("input[name=check]").prop("checked", true);
		} else {
			// #allCheck가 체크상태가 아니면 전체 체크박스에 checked 속성을 제거함
			$("input[name=check]").prop("checked", false);
		}
	});
});
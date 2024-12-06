$(function(){	
  $(document).ready(function() {
    $('tbody').on('click', 'tr', function() {
        // tr이 클릭되었을 때 처리할 내용
        let est_id = $(this).find('td:first').text();  // 예시로 첫 번째 td에서 user_id를 가져옴
      //  alert(est_id);
        //새창으로
/*        window.open('userDetail.do?user_id=' + userId, '_blank');*/
        
        //location.href = 'productdetail.do?est_id=' + est_id;
        
        // URL 확인 로그 추가
        let url = 'productdetail.do?est_id=' + est_id;
        console.log("Navigating to URL: ", url); // URL 출력

        // 페이지 이동
        location.href = url;
    });
  });
});

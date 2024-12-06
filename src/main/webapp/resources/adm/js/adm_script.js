
//=======================================================================================
// 테이블 script
//=======================================================================================

window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple);
    }
});
//=======================================================================================
	
	<!-- 삭제 확인 모달 -->

    function confirmDelete(optNum, optName) {
        if (confirm(optName+' 이 옵션을 삭제하시겠습니까?')) {
            window.location.href = 'deleteOption?optNum=' + optNum;
        }
    }

    
            // 모달을 띄우기 위한 함수
        function showDeleteModal(optNum) {
            // 모달 창을 띄우기
            document.getElementById("deleteModal").style.display = "block";
            // 선택한 옵션 번호를 삭제 버튼에 연결
            document.getElementById("deleteButton").onclick = function() {
                window.location.href = "/deleteOption?optNum=" + optNum;
            };
        }

        // 모달 창을 닫기 위한 함수
        function closeModal() {
            document.getElementById("deleteModal").style.display = "none";
        }
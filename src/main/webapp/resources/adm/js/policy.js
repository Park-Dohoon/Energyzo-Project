function toggleAll() {
    var contents = document.querySelectorAll('.tooltip-content');
    contents.forEach(function(content) {
        if (content.style.display === "none" || content.style.display === "") {
            content.style.display = "block";  // 전체 보기
        } else {
            content.style.display = "none";  // 전체 숨기기
        }
    });
}




 function toggleContent(contentId, arrowId) {
    var content = document.getElementById(contentId);
    if (content.style.display === "none" || content.style.display === "") {
        content.style.display = "block";  // 보이게 설정
    } else {
        content.style.display = "none";  // 숨기기
    }
}


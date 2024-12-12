		
		document.addEventListener('DOMContentLoaded', function () {
    // 비밀번호 보이기/숨기기
    document.getElementById('toggle-password').addEventListener('click', function () {
        var passwordField = document.getElementById('password');
        var icon = this.querySelector('i');
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            icon.classList.replace('bi-eye', 'bi-eye-slash');
        } else {
            passwordField.type = 'password';
            icon.classList.replace('bi-eye-slash', 'bi-eye');
        }
    });

    document.getElementById('toggle-confirm-password').addEventListener('click', function () {
        var confirmPasswordField = document.getElementById('confirm-password');
        var icon = this.querySelector('i');
        if (confirmPasswordField.type === 'password') {
            confirmPasswordField.type = 'text';
            icon.classList.replace('bi-eye', 'bi-eye-slash');
        } else {
            confirmPasswordField.type = 'password';
            icon.classList.replace('bi-eye-slash', 'bi-eye');
        }
    });
});
		
document.addEventListener("DOMContentLoaded", function() {
    var dropdownIcon = document.getElementById('dropdownIcon');
    var dropdownMenu = document.getElementById('dropdownMenu');

    dropdownIcon.addEventListener('click', function() {
        dropdownMenu.classList.toggle('show');
    });

    window.addEventListener('click', function(event) {
        if (!event.target.closest('.header__icons')) {
            dropdownMenu.classList.remove('show');
        }
    });

    dropdownIcon.addEventListener('keydown', function(event) {
        if (event.key === 'Enter' || event.key === ' ') {
            event.preventDefault();
            dropdownMenu.classList.toggle('show');
        } else if (event.key === 'Escape') {
            dropdownMenu.classList.remove('show');
        }
    });
});
document.addEventListener("DOMContentLoaded", function() {
    var dropdownIcon = document.getElementById('dropdownIcon');
    var dropdownMenu = document.getElementById('dropdownMenu');

    // Toggle dropdown menu
    dropdownIcon.addEventListener('click', function() {
        dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
    });

    // Close the dropdown and mobile menu if the user clicks outside of them
    window.addEventListener('click', function(event) {
        if (!event.target.closest('.header__icons')) {
            dropdownMenu.style.display = "none";
        }
    });

    // Handle Enter or Space key for accessibility
    dropdownIcon.addEventListener('keydown', function(event) {
        if (event.key === 'Enter' || event.key === ' ') {
            event.preventDefault();
            dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
        }
    });
});
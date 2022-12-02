const theme = localStorage.getItem('darkTheme');
//page loaded
document.addEventListener('DOMContentLoaded', function () {
    if (theme == null) {
        if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
            setDarkMode(1);
            localStorage.setItem('darkTheme', 1);
        }
        else {
            setDarkMode(0);
            localStorage.setItem('darkTheme', 0);
        }
    }
    else {
        setDarkMode(theme);
    }
});

function setDarkMode(val) {
    localStorage.setItem('darkTheme', val);

    if (val == 1) {
        //plain javacscript without jquery add theme dark and remove theme light from body
        document.body.classList.add('theme-dark');
        document.body.classList.remove('theme-light');        
    }
    else {
        document.body.classList.remove('theme-dark');
        document.body.classList.add('theme-light');        
    }
}
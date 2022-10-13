const overlay = document.querySelector('.overlay')
const popup_close = document.querySelector('.popup-close')

var quick_view = document.querySelectorAll('.quick-view')

popup_close.addEventListener('click', PopupClose)
overlay.addEventListener('click', PopupClose)

function PopupOpen() {
    for(var index in quick_view) {
        quick_view[index].addEventListener('click', function() {
            overlay.classList.remove('hide')
        })
    }
}

PopupOpen()

function PopupClose() {
    overlay.classList.add('hide')
}

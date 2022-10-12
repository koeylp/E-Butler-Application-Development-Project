/**
 * Main
 */

'use strict';

let menu, animate;

(function () {
  // Initialize menu
  //-----------------

  let layoutMenuEl = document.querySelectorAll('#layout-menu');
  layoutMenuEl.forEach(function (element) {
    menu = new Menu(element, {
      orientation: 'vertical',
      closeChildren: false
    });
    // Change parameter to true if you want scroll animation
    window.Helpers.scrollToActive((animate = false));
    window.Helpers.mainMenu = menu;
  });

  // Initialize menu togglers and bind click on each
  let menuToggler = document.querySelectorAll('.layout-menu-toggle');
  menuToggler.forEach(item => {
    item.addEventListener('click', event => {
      event.preventDefault();
      window.Helpers.toggleCollapsed();
    });
  });

  // Display menu toggle (layout-menu-toggle) on hover with delay
  let delay = function (elem, callback) {
    let timeout = null;
    elem.onmouseenter = function () {
      // Set timeout to be a timer which will invoke callback after 300ms (not for small screen)
      if (!Helpers.isSmallScreen()) {
        timeout = setTimeout(callback, 300);
      } else {
        timeout = setTimeout(callback, 0);
      }
    };

    elem.onmouseleave = function () {
      // Clear any timers set to timeout
      document.querySelector('.layout-menu-toggle').classList.remove('d-block');
      clearTimeout(timeout);
    };
  };
  if (document.getElementById('layout-menu')) {
    delay(document.getElementById('layout-menu'), function () {
      // not for small screen
      if (!Helpers.isSmallScreen()) {
        document.querySelector('.layout-menu-toggle').classList.add('d-block');
      }
    });
  }

  // Display in main menu when menu scrolls
  let menuInnerContainer = document.getElementsByClassName('menu-inner'),
    menuInnerShadow = document.getElementsByClassName('menu-inner-shadow')[0];
  if (menuInnerContainer.length > 0 && menuInnerShadow) {
    menuInnerContainer[0].addEventListener('ps-scroll-y', function () {
      if (this.querySelector('.ps__thumb-y').offsetTop) {
        menuInnerShadow.style.display = 'block';
      } else {
        menuInnerShadow.style.display = 'none';
      }
    });
  }

  // Init helpers & misc
  // --------------------

  // Init BS Tooltip
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });

  // Accordion active class
  const accordionActiveFunction = function (e) {
    if (e.type == 'show.bs.collapse' || e.type == 'show.bs.collapse') {
      e.target.closest('.accordion-item').classList.add('active');
    } else {
      e.target.closest('.accordion-item').classList.remove('active');
    }
  };

  const accordionTriggerList = [].slice.call(document.querySelectorAll('.accordion'));
  const accordionList = accordionTriggerList.map(function (accordionTriggerEl) {
    accordionTriggerEl.addEventListener('show.bs.collapse', accordionActiveFunction);
    accordionTriggerEl.addEventListener('hide.bs.collapse', accordionActiveFunction);
  });

  // Auto update layout based on screen size
  window.Helpers.setAutoUpdate(true);

  // Toggle Password Visibility
  window.Helpers.initPasswordToggle();

  // Speech To Text
  window.Helpers.initSpeechToText();

  // Manage menu expanded/collapsed with templateCustomizer & local storage
  //------------------------------------------------------------------

  // If current layout is horizontal OR current window screen is small (overlay menu) than return from here
  if (window.Helpers.isSmallScreen()) {
    return;
  }

  // If current layout is vertical and current window screen is > small

  // Auto update menu collapsed/expanded based on the themeConfig
  window.Helpers.setCollapsed(true, false);
})();


// Popup confirm
const delBtns = document.querySelectorAll('.js-delete')
const modal = document.querySelector('.js-modal')
const modalClose = document.querySelector('.js-modal-close')
const modalCancel = document.querySelector('.js-modal-close-2')

function showModal() {
  modal.style.display = "block";
  modal.classList.add('open');
}

function removeModal() {
  modal.style.display = "none";
  modal.classList.remove('open');
}


for (const delBtn of delBtns) {
  delBtn.addEventListener('click', showModal)
}

modalClose.addEventListener('click', removeModal)

modalCancel.addEventListener('click', removeModal)

// End popup 

// Popup Filter
// document.getElementById("click").onclick = function () {
//   myFunction()
// }

// function myFunction() {
//   document.getElementById("click").innerHTML = "<<h2>abc</h2>>"
// }


//End Popup Filter


// Popup edit

const editBtns = document.querySelectorAll('.js-edit')
const modalEdit = document.querySelector('.js-modal-confirm')
const modalCloseEdit = document.querySelector('.js-modal-close-1')
const close1 = document.querySelector('.js-modal-close-3')


function showModalEdit() {
  modalEdit.style.display = "block";
  modalEdit.classList.add('open')
}

function removeModalEdit() {
  modalEdit.style.display = "none";
  modalEdit.classList.remove('open')
}

for (const editBtn of editBtns) {
  editBtn.addEventListener('click', showModalEdit);
}

modalCloseEdit.addEventListener('click', removeModalEdit)

close1.addEventListener('click', removeModalEdit)


// popup edit end

const createAdminBtns = document.querySelector('.js-create-admin')
const modalCreate = document.querySelector('.js-modal-create')
const modalCloseAdmin = document.querySelector('.js-modal-close-4')
const modalCancelAdmin = document.querySelector('.js-modal-close-5')



const showModalCreate = () => {
  modalCreate.style.display = "block";
  modalCreate.classList.add('open')
}

const removeModalCreate = () => {
  modalCreate.style.display = "none";
  modalCreate.classList.remove('open')
}

createAdminBtns.addEventListener('click', showModalCreate)

modalCloseAdmin.addEventListener('click', removeModalCreate)

modalCancelAdmin.addEventListener('click', removeModalCreate)



window.onclick = function (event) {

  if (event.target == modalCreate) {
    modalCreate.style.display = "none";
  }
  if (event.target == modalEdit) {
    modalEdit.style.display = "none";
  }
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

const modalP = document.querySelector('.js-modal-confirm')
const changepassbtn = document.getElementById('changepassbtn')

const passPage = () => {
  modalP.style.display = 'none'
}
changepassbtn.addEventListener('click',passPage)

function activeProduct() {
  document.getElementById('product').classList.add('active') ;
  document.getElementById('service').classList.remove('active') ;
  document.getElementById('order').classList.remove('active') ;
  document.getElementById('staff').classList.remove('active') ;
}
function activeService() {
  document.getElementById('product').classList.remove('active') ;
  document.getElementById('service').classList.add('active') ;
  document.getElementById('order').classList.remove('active') ;
  document.getElementById('staff').classList.remove('active') ;
}
function activeOrder() {
  document.getElementById('product').classList.remove('active') ;
  document.getElementById('service').classList.remove('active') ;
  document.getElementById('order').classList.add('active') ;
  document.getElementById('staff').classList.remove('active') ;
}
function activeStaff() {
  document.getElementById('product').classList.remove('active') ;
  document.getElementById('service').classList.remove('active') ;
  document.getElementById('order').classList.remove('active') ;
  document.getElementById('staff').classList.add('active') ;
}
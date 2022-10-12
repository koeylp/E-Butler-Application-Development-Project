(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.nav-bar').addClass('sticky-top');
        } else {
            $('.nav-bar').removeClass('sticky-top');
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        items: 1,
        dots: true,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ]
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 24,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsive: {
            0:{
                items:1
            },
            992:{
                items:2
            }
        }
    });
    
})(jQuery);
(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.nav-bar').addClass('sticky-top');
        } else {
            $('.nav-bar').removeClass('sticky-top');
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        items: 1,
        dots: true,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ]
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 24,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsive: {
            0:{
                items:1
            },
            992:{
                items:2
            }
        }
    });
    
})(jQuery); 
function addProduct () {
    let show = document.getElementById('overlayProduct') ;  
        show.style.display = 'block'  
}
function hideProduct () {
    let show = document.getElementById('overlayProduct') ; 
        show.style.display = 'none' 
} 

function showProduct() {
    document.getElementById('tableProduct').classList.add('showEdit')
    document.getElementById('tableService').classList.remove('showEdit') 
    document.getElementById('tableOrder').classList.remove('showEdit')
     document.getElementById('tableStaff').classList.remove('showEdit')
}
function showService() {
    document.getElementById('tableProduct').classList.remove('showEdit')
    document.getElementById('tableService').classList.remove('showEdit') 
    document.getElementById('tableOrder').classList.remove('showEdit')
     document.getElementById('tableStaff').classList.remove('showEdit')
     document.getElementById('tableService').classList.add('showEdit') 
}
function showOrder() {
    document.getElementById('tableProduct').classList.remove('showEdit')
    document.getElementById('tableService').classList.remove('showEdit') 
    document.getElementById('tableOrder').classList.add('showEdit')
     document.getElementById('tableStaff').classList.remove('showEdit')
}
function showStaff() {
    document.getElementById('tableProduct').classList.remove('showEdit')
    document.getElementById('tableService').classList.remove('showEdit') 
    document.getElementById('tableOrder').classList.remove('showEdit')
     document.getElementById('tableStaff').classList.add('showEdit')
}
function addService () {
    let show = document.getElementById('overlayService') ;  
        show.style.display = 'block'  
}
function hideService () {
    let show = document.getElementById('overlayService') ; 
        show.style.display = 'none' 
} 
function addStaff () {
    let show = document.getElementById('overlayStaff') ;  
        show.style.display = 'block'  
}
function hideStaff () {
    let show = document.getElementById('overlayStaff') ; 
        show.style.display = 'none' 
}  


function editProduct() {
    document.getElementById('editProduct').style.display = 'block' 
}
function hideEditProduct() {
    document.getElementById('editProduct').style.display = 'none' 
}


function editService() {
    document.getElementById('editService').style.display = 'block' 
}
function hideEditService() {
    document.getElementById('editService').style.display = 'none' 
}



function editStaff() {
    document.getElementById('editStaff').style.display = 'block' 
}
function hideEditStaff() {
    document.getElementById('editStaff').style.display = 'none'  
}
function changePassword1() {
    document.getElementById('changePassword').classList.toggle('showEdit') ;
} 


// FUNCTION FOR EDIT PROFILE
function editName() {
    document.getElementById('editName').classList.toggle('showEdit') ;

}
function editAddress() {
    document.getElementById('editaddress').classList.toggle('showEdit') ;
}
function editPhone() {
     document.getElementById('editPhone').classList.toggle('showEdit') ;
}
function editProfile() { 
    document.getElementById('profile').classList.toggle('showEdit')   ; 
}
function editEmail() { 
    document.getElementById('editEmail').classList.toggle('showEdit')   ; 
}
function editLogo() { 
    document.getElementById('editLogo').classList.toggle('showEdit')   ; 
}


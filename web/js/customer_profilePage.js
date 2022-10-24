var form = document.querySelectorAll('.form')
var navi_link = document.querySelectorAll('.navi--link')

const account = document.querySelector('.account')
const order_his = document.querySelector('.order-his')
const address = document.querySelector('.address')
const password = document.querySelector('.password')

const account_form = document.querySelector('.account-form')
const order_his_form = document.querySelector('.order-his-form')
const address_form = document.querySelector('.address-form')
const password_form = document.querySelector('.password-form')

const address_add = document.querySelector('.address_add')
const address_detail__add = document.querySelector('.address_detail__add')
const close_address = document.querySelector('.close_address')


const address_edit = document.querySelectorAll('.address_edit')
const address_detail__edit = document.querySelectorAll('.address_detail__edit')
const close_edit_address = document.querySelectorAll('.close_edit_address')

console.log(account)

// account.addEventListener('click', function() {
//     CloseAllForm()
//     ResetLink()
//     account.classList.add('bold')
//     account_form.classList.remove('hide')
// })

address_add.addEventListener('click', function() {
    address_detail__add.classList.remove('hide')
})

close_address.addEventListener('click', function() {
    address_detail__add.classList.add('hide')
})

for(let i = 0; i < address_edit.length; i++) {
    address_edit[i].addEventListener('click', function() {
        address_detail__edit[i].classList.remove('hide')
    })
}

for(let i = 0; i < close_edit_address.length; i++) {
    close_edit_address[i].addEventListener('click', function() {
        address_detail__edit[i].classList.add('hide')
    })
}


account.addEventListener('click', function() {
    CloseAllForm()
    ResetLink()
    account.classList.add('bold')
    account_form.classList.remove('hide')
})

order_his.addEventListener('click', function() {
    CloseAllForm()
    ResetLink()
    this.classList.add('bold')
    order_his_form.classList.remove('hide')
})

address.addEventListener('click', function() {
    CloseAllForm()
    ResetLink()
    this.classList.add('bold')
    address_form.classList.remove('hide')
})

password.addEventListener('click', function() {
    CloseAllForm()
    ResetLink()
    this.classList.add('bold')
    password_form.classList.remove('hide')
})

function CloseAllForm() {
    for(var i = 0; i < form.length; i++) {
        form[i].classList.add('hide')
    }
}

function ResetLink() {
    for(var i = 0; i < form.length; i++) {
        navi_link[i].classList.remove('bold')
    }
}
// User Registration
let emailAjax = null;

function checkEmail() {
    const userEmail = document.getElementById("email").value;
    console.log("User Email " + userEmail);

    if (window.XMLHttpRequest) {
        emailAjax = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        emailAjax = new ActiveXObject(Microsoft.XMLHTTP);
    }
    emailAjax.onreadystatechange = handleEmailUserValidation;
    emailAjax.open("GET", "checkEmail" + "?userEmail=" + userEmail + "&timeStamp=" + new Date().getTime(), true);
    // emailAjax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    emailAjax.send(null);

}

function handleEmailUserValidation() {
    if (emailAjax.readyState === 4 && emailAjax.status === 200) {
        console.log("Validation result " + emailAjax.responseText)
        let responseText = emailAjax.responseText;
        if (responseText === "Exist") {
            document.getElementById("emailExist").hidden = false;
            document.getElementById("emailNotExist").hidden = true;

        }
        if (responseText === "Not Exist") {
            document.getElementById("emailNotExist").hidden = false;
            document.getElementById("emailExist").hidden = true;
        }
    }
}

//Match password

function passwordIsStrong() {
    let password = document.getElementById("password").value;
    document.getElementById("passwordIsStrong").hidden = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$/.exec(password);
}

function passwordConfirmation() {
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirmPassword").value;
    console.log("password " + password + " confirmPassword" + confirmPassword)
    if (password === confirmPassword) {
        document.getElementById("passwordIsNotConfirmed").hidden = false;
        document.getElementById("passwordIsConfirmed").hidden = true;
        console.log("matched")
    } else {
        document.getElementById("passwordIsNotConfirmed").hidden = true;
        document.getElementById("passwordIsConfirmed").hidden = false;
        console.log("Not matched")

    }
}

window.onload = function () {

    const fullName = document.getElementById('fullName').textContent;
    if (fullName != null) {
        document.getElementById('profileImage').innerHTML = fullName.split(' ').map(name => name[0]).join('').toUpperCase();
        console.log(fullName);

    }

}




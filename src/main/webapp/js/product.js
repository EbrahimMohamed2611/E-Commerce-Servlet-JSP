let getAllCategoryRequest = null;
document.onload = getAllCategory;
function getAllCategory(){
    getAllCategoryRequest = new XMLHttpRequest();
    getAllCategoryRequest.open("GET", "addCategory?timeStamp=" + new Date().getTime(), true);
    getAllCategoryRequest.onreadystatechange = handleCategory;
    getAllCategoryRequest.send(null);
}

function handleCategory (){
    if (getAllCategoryRequest.readyState === 4 && getAllCategoryRequest.status === 200) {
        if(getAllCategoryRequest.responseText){
            const allCategory = JSON.parse(getAllCategoryRequest.responseText);
            let categoryName = document.getElementById("category-id");
            console.log("categoryName",categoryName);
            let tableStr2 ="";
            for (let i = 0; i < allCategory.length; i++) {
                tableStr2 +=`<option value="${allCategory[i].categoryName}">${allCategory[i].categoryName}</option>`;
                categoryName.innerHTML = tableStr2;
                console.log("categoryName" , categoryName);
            }
        }
        console.log("Responding " + getAllCategoryRequest.responseText);
    }
}


document.getElementById("product-img").onchange = function () {
    if (this.files && this.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('product-pic').setAttribute('src', e.target.result);
        };
        reader.readAsDataURL(this.files[0]);
    }
}






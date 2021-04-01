let categoryRequest = null;
let getAllCategoryRequest = null;
document.onload = getAllCategory;
function getAllCategory(){
    console.log("Ajax ??!")
    document.getElementById("category-added").hidden = true;
    getAllCategoryRequest = new XMLHttpRequest();
    getAllCategoryRequest.open("GET", "addCategory?timeStamp=" + new Date().getTime(), true);
    getAllCategoryRequest.onreadystatechange = handleCategory;
    getAllCategoryRequest.send(null);
}

function handleCategory (){
    console.log("getAllCategoryRequest.readyState "  +getAllCategoryRequest.readyState)
    if (getAllCategoryRequest.readyState === 4 && getAllCategoryRequest.status === 200) {
        if(getAllCategoryRequest.responseText){
            let table2 = document.getElementById("category-id");
            console.log("table2",table2);
            const allCategory = JSON.parse(getAllCategoryRequest.responseText);
            let tableStr2 ="";
            for (let i = 0; i < allCategory.length; i++) {
                tableStr2 +=
                    "<tr>" +
                    "<td>"+allCategory[i].categoryId+"</td>\n" +
                    "<td>"+allCategory[i].categoryName+"</td>\n" +
                    "<td><a href=\"#\" class=\"btn btn-warning\">Edit</a></td>\n" +
                    "<td><a href=\"#\" class=\"btn btn-danger\">Remove</a></td>\n" +
                    "</tr>";

                table2.innerHTML = tableStr2;
                console.log("table" , table2);
            }
        }
        console.log("Responding " + getAllCategoryRequest.responseText);
    }
}

function addCategory (){

    const categoryName = document.getElementById("categoryName").value;
    console.log("categoryName " + categoryName)
    categoryRequest = new XMLHttpRequest();
    categoryRequest.onreadystatechange = handleLogin;
    categoryRequest.open("POST", "addCategory", true);
    categoryRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    const parameters = "categoryName=" + categoryName ;
    categoryRequest.send(parameters);

}

function handleLogin() {
    console.log(categoryRequest.readyState);
    if (categoryRequest.readyState === 4 && categoryRequest.status === 200) {
        if(categoryRequest.responseText){
            document.getElementById("category-added").hidden = false;
            let table = document.getElementById("category-id");
            console.log("table",table);
            document.getElementById("categoryName").value = "";
            const jsonObj = JSON.parse(categoryRequest.responseText);
            let tableStr ="";
            for (let i = 0; i < jsonObj.length; i++) {
                tableStr +=
                    "<tr>" +
                    "<td>"+jsonObj[i].categoryId+"</td>\n" +
                    "<td>"+jsonObj[i].categoryName+"</td>\n" +
                    "<td><a href=\"#\" class=\"btn btn-warning\">Edit</a></td>\n" +
                    "<td><a href=\"#\" class=\"btn btn-danger\">Remove</a></td>\n" +
                    "</tr>";

                table.innerHTML = tableStr;
                 console.log("table" , table);
            }
        }
        console.log("Responding " + categoryRequest.responseText);
    }
}

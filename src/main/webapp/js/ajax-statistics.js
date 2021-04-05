 $(function () {
     setInterval(function getAllStatistics(){
         $.ajax({
             type: 'POST',
             url: 'statisticsController',
         })
             .done(function(response) {
                 console.log(response);
                 console.log("response.users" ,response.users);
                 $("#allUsers").text(response.users);
                 $("#allOrders").text(response.completedOrders + response.notCompletedOrders);
                 $("#completedOrders").text(response.completedOrders);
                 $("#notCompletedOrders").text(response.notCompletedOrders);
                 $("#numberOfProducts").text(response.products);
             })
     }, 10000);

    });


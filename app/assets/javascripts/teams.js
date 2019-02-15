// $(document).ready(function() {
// 	$("#mymodalbutton").click(function(){
// 		// var $modal = $("#ajax-modal");
// 		//$modal = document.getElementById("ajax-modal");
// 		var url = $("#mymodalbutton").data("url");
// 		//console.log(url);

// 		$("#ajax-modal").load(url, function(response, status, xhr){
// 			//console.log(response);
// 			if(status == 'success') { 
// 				$("#ajax-modal").modal('show'); 
// 			}
// 			else {
// 			  alert('You are not authorized to perform this action', 'error');
// 			}
// 		});
// 	});
// });

$(document).on("click", ".open-AddPointDialog", function (e) {
	var url = $(this).data("url");
	$modal = $('#addPointDialog');

	$modal.load(url, function(response, status, xhr){
		if(status == 'success') { 
			$modal.modal('toggle'); 
		}
		else {
		  alert('You are not authorized to perform this action', 'error');
		}
	});
});

// var $modal = $("#ajax-modal");
// $modal.load($(this).data("url"), function(response, status, xhr){
// 	if(status == 'success') { $modal.modal(); }
// 	else {
// 	  alert('You are not authorized to perform this action', 'error');
// 	}
// });

// $("#ajax-modal").on("show.bs.modal", function() {
//     var url = $("#mymodalbutton").data("url");
//     $(this).find(".modal-body").load(link.attr("href"));
// });


function remove(id,rel){
	swal({
      title: "Are you sure ?",
      text: "Delete your data",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      confirmButtonText: "Yes, delete it",
      cancelButtonText: "No, cancel",
      closeOnConfirm: false,
      closeOnCancel: false
    },
    function(isConfirm) {
      if (isConfirm) {
        swal("Deleted!", "Your data has deleted.", "success");
        window.location.href="/"+rel+"/"+id;
        
      } else {
        swal("Cancelled", "Your data is safe :)", "error");
        
      }
    });
}
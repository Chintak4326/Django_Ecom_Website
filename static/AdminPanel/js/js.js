<script type="text/javascript">
	function deletedata(id){
	alert(id,url);
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
        //window.location.href="{% url 'add_state_delete' rel %}";
      } else {
        swal("Cancelled", "Your data is safe :)", "error");
      }
    });
  }

</script>
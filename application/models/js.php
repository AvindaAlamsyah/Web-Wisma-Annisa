<?php
class js extends CI_Model{
	public $penghuni='<script src="<?php echo base_url();?>asset/js/jquery.min.js"></script>
<script src="<?php echo base_url();?>asset/js/jquery.ui.min.js"></script>
<script src="<?php echo base_url();?>asset/js/bootstrap.min.js"></script>



<!-- plugins -->
<script src="<?php echo base_url();?>asset/js/plugins/moment.min.js"></script>
<script src="<?php echo base_url();?>asset/js/plugins/jquery.datatables.min.js"></script>
<script src="<?php echo base_url();?>asset/js/plugins/datatables.bootstrap.min.js"></script>
<script src="<?php echo base_url();?>asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="<?php echo base_url();?>asset/js/main.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $("#datatables-example").DataTable();
  });
</script>';
}
?>

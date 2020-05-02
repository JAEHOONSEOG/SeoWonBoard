/**
 * List js
 */
$(document).ready(function(){
	var makeQuery = $("#makeQuery").val();
	$(".btn-secondary").on("click", function(event){
		self.location = "list"
			+ makeQuery
            + "&searchType="
            + $("select option:selected").val()
            + "&keyword=" + $("#keywordInput").val();
    });
});
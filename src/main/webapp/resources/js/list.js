/**
 * List js
 */
$(document).ready(function(){
	$(".btn-secondary").on("click", function(event){
		self.location = "list"
			+ "${pageMaker.makeQuery(1)}"
            + "&searchType="
            + $("select option:selected").val()
            + "&keyword=" + $("#keywordInput").val();
    });
});
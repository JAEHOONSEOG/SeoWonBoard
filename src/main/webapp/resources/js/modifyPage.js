/**
 * Modify Page js 
 */
$(document).ready(function(){

	var formObj = $("form[role='form']");

    console.log(formObj);

    $(".btn-primary").on("click", function(){
    	formObj.submit();        	
    });

    $(".btn-warning").on("click", function(){
    	self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
    		+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
    });
});
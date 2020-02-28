<!DOCTYPE html>
<html>
<head len="en">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div id="displayDiv">
  <ul id="replies">
  
  </ul>
</div>
<script id="template" type="text/x-handlebars-template">
  <span>{{name}}</span>
  <div>
    <span>{{userid}}</span>
    <span>{{addr}}</span>
  </div>
  {{#each .}}
    <li class="replyLi">
      <div>{{rno}}</div>
      <div>{{replytext}}</div>
      <div>{{replydate}}</div>
    </li>
  {{/each}}
</script>
<script>
  var source = $("#template").html();
  var template = Handlebars.compile(source);
  var data = [
	  {rno:1, replytext:"text01", replydate:new Date()},
	  {rno:2, replytext:"text02", replydate:new Date()},
	  {rno:3, replytext:"text03", replydate:new Date()},
	  {rno:4, replytext:"text04", replydate:new Date()},
	  {rno:5, replytext:"text05", replydate:new Date()}
  ];

  $("#replies").html(template(data));
</script>
</body>
</html>
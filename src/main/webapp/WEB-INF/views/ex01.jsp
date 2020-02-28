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
  
</div>
<script id="template" type="text/x-handlebars-template">
  <span>{{name}}</span>
  <div>
    <span>{{userid}}</span>
    <span>{{addr}}</span>
  </div>
</script>
<script>
  var source = $("#template").html();
  var template = Handlebars.compile(source);
  var data = {name:"Daniel", userid:"user00", addr:"NewYork"}

  $("#displayDiv").html(template(data));
</script>
</body>
</html>
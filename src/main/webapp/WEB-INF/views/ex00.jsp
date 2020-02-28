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

<script>
  var source = "<h1><p>{{name}}</p> <p>{{userid}}</p> <p>{{addr}}</P></h1>";
  var template = Handlebars.compile(source);
  var data = {name:"Daniel", userid:"user00", addr:"NewYork"}
  
  $("#displayDiv").html(template(data));
</script>

</body>
</html>
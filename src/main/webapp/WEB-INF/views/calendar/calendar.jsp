<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Seowon StoreHouse</title>

  <!-- Bootstrap core CSS -->
  <link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../../../resources/css/blog.css" rel="stylesheet">
  <link href="../../../resources/css/fullcalendar.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../../../resources/js/fullcalendar.js"></script>
  <script src="../../../resources/js/locales-all.js"></script>
  
  <script>

	  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		      },
		      initialDate: '2020-09-12',
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: true, // display business hours
		      editable: true,
		      selectable: true,
		      selectHelper: true,
		      eventLimit:true,
		      select: function(start, end){
			  },
			  eventClick: function(info){
				  var eventObj = info.event;
				  console.log('title : ' + eventObj.title);
				  $("#successModal .modal-body p").text(eventObj.title);
				  $("#successModal").modal("show");
			  },
/* 			  eventRender: function(event, element){
				element.attr('href','javascript:void(0);');
				element.click(function(){
					$('#startTime').html(moment(event.start).format('DD/MM/YYYY HH:mm'));
					$('#endTime').html(moment(event.end).format('DD/MM/YYYY HH:mm'));
					$('#eventInfo').html(event.description);
					$('#eventLink').attr('href', event.url);
					$('#eventContent').dialog({modal:true, titel:event.title, width:350});
				})
			  }, */
		      events: [
		        {
		          title: 'Business Lunch',
		          start: '2020-09-03T13:00:00',
		          constraint: 'businessHours'
		        },
		        {
		          title: 'Meeting',
		          start: '2020-09-13T11:00:00',
		          constraint: 'availableForMeeting', // defined below
		          color: '#257e4a'
		        },
		        {
		          title: 'Conference',
		          start: '2020-09-18',
		          end: '2020-09-20'
		        },
		        {
		          title: 'Party',
		          start: '2020-09-29T20:00:00'
		        },

		        // areas where "Meeting" must be dropped
		        {
		          groupId: 'availableForMeeting',
		          start: '2020-09-11T10:00:00',
		          end: '2020-09-11T16:00:00',
		          display: 'background'
		        },
		        {
		          groupId: 'availableForMeeting',
		          start: '2020-09-13T10:00:00',
		          end: '2020-09-13T16:00:00',
		          display: 'background'
		        },

		        // red areas where no events can be dropped
		        {
		          start: '2020-09-24',
		          end: '2020-09-28',
		          overlap: false,
		          display: 'background',
		          color: '#ff9f89'
		        },
		        {
		          start: '2020-09-06',
		          end: '2020-09-08',
		          overlap: false,
		          display: 'background',
		          color: '#ff9f89'
		        }
		      ]
		    });

		    calendar.render();
		  });
  </script>
  <style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

  #container {
    margin-top: 100px;
    margin-left: 400px;
    float: left;
    width: 700px;
    /* height: 600px; */
  }

  .col-md-4 {
    float: right;
    margin-top: 20px;
    margin-right: 400px;
    width: 380px;
  }
</style>
</head>
<body>
  <!-- Navigation -->
  <jsp:include page="../com/navigation.jsp" />
  <div id="container">
      <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    		<span aria-hidden="true">&times;</span>
			  		</button>
			  		<p></p>
				</div>
          	</div>
		</div>
	  </div>
	  <div id="calendar"></div>
  </div>
  <!-- Sidebar Widgets Column -->
  <jsp:include page="../com/sideBar.jsp"/>
</body>
</html>
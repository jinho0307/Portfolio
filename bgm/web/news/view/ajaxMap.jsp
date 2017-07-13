<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test 페이지</title>
<style type="text/css">
#page {
	width: 1150px;
	height: 500px;
}
</style>
<script src="/bgm/common/js/jquery-3.1.1.min.js"></script>

<script>
	$(document).ready(function() {
		$('header').load("/bgm/common/view/header.jsp");
		$('footer').load("/bgm/common/view/footer.jsp");

	});
</script>

</head>
<header></header>
<body>
	<div id="page">

		<div id="map"
			style='width: 300px; height: 300px; position: absolute; left: 300px; top: 300px;'></div>
		<script>
			function initMap() {

				$.ajax({
					url : "/bgm/viewMap",
					type : "get",
					dataType : "json",
					success : function(data) {

						var location = JSON.stringify(data);
						var location = JSON.parse(location);

						var myLatLng = {
							lat : location.lat,
							lng : location.lng
						};

						// Create a map object and specify the DOM element for display.
						var map = new google.maps.Map(document
								.getElementById('map'), {
							zoom : 17,
							center : myLatLng
						});

						var marker = new google.maps.Marker({
							position : myLatLng,
							draggable : true,
							animation : google.maps.Animation.DROP,
							map : map,
							title : 'maker'
						});
						marker.addListener('click', toggleBounce);
					}

				});

			}

			function toggleBounce() {
				if (marker.getAnimation() !== null) {
					marker.setAnimation(null);
				} else {
					marker.setAnimation(google.maps.Animation.BOUNCE);
				}

			}

			//구글맵 사용법
			//https://developers.google.com/maps/documentation/javascript/markers?hl=ko
		</script>

		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5JnBGdIq1_1Q2vfxIZ6z-867Q7cNzv1A&callback=initMap"
			async defer></script>

	</div>

</body>
<footer></footer>
</html>

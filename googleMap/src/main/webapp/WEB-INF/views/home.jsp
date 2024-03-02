<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>googleMap - home.jsp</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8TkYWxQVEVGLiPSTzBFr1jY1y4D3SON0&libraries=places"></script>
    <style>
        .frame{
            width: 1000px;
            margin: 20px auto;
        }
        button{
            background-color: white;
            border: 1px solid black;
            margin-right: 10px;
        }
        #map{
        	width: 450px;
        	height: 450px;
        }
        #place-search{
        	margin: 20px;
        	height: 20px;
        	width: 150px;
        	margin-left: 0;
        }
    </style>  
</head>
<body>

	<div class="frame">
		<h1>구글 맵</h1>
		<hr>
	    <input id="place-search" type="text" placeholder="장소 검색">
	    <div id="map"></div>
	</div>
	
    <script>
        let map
        let marker
        let infowindow
        let geocoder

        function initMap() {
            const center = { lat: 35.166958551501004, lng: 129.132925239425 }
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: center
            })

            infowindow = new google.maps.InfoWindow()
            geocoder = new google.maps.Geocoder()

            const input = document.getElementById('place-search')
            const searchBox = new google.maps.places.SearchBox(input)

            map.addListener('bounds_changed', function() {
                searchBox.setBounds(map.getBounds())
            })

            searchBox.addListener('places_changed', function() {
                const places = searchBox.getPlaces()

                if (places.length == 0) {
                    return;
                }

                // 오래된 마커 정리
                if (marker) {
                    marker.setMap(null)
                }

                // 반복문
                const bounds = new google.maps.LatLngBounds()
                places.forEach(function(place) {
                    if (!place.geometry) {
                        console.log("Returned place contains no geometry")
                        return
                    }

                    // 각각의 장소에 마커생성
                    marker = new google.maps.Marker({
                        map: map,
                        position: place.geometry.location
                    })

                    google.maps.event.addListener(marker, 'click', function() {
                        geocoder.geocode({'location': place.geometry.location}, function(results, status) {
                            if (status === 'OK') {
                                if (results[0]) {
                                    infowindow.setContent(
                                    			place.name + '<br>' + 
                                    			results[0].formatted_address + '<br><br>' +
                                    			'<button id="save-marker" onclick="markerSaveHandler()">저장</button>' +
                                    			'<button id="share" onclick="shareHandler()">공유</button>' +
												'<button id="memo" onclick="doMemo()">메모</button>'
                                    		)
                                    infowindow.open(map, marker)
                                } else {
                                    window.alert('결과 없음')
                                }
                            } else {
                                window.alert('이거 때문에 실패함: ' + status)
                            }
                        })
                    })

                    if (place.geometry.viewport) {
                        bounds.union(place.geometry.viewport)
                    } else {
                        bounds.extend(place.geometry.location)
                    }
                })
                map.fitBounds(bounds)
            })
        }
        
//         document.getElementById('save-marker').addEventListener('click', function() {
//             if (marker) {
//                 const markerPos = marker.getPosition()
//                 console.log('마커 저장쓰 ' +  markerPos.lat() + ', ' + markerPos.lng())
//                 // 데이터베이스에 위도 경도 보내서 저장하면 될듯
//             } else {
//                 console.log("마커 저장안댐")
//             }
//         })

        function markerSaveHandler() {
          if (marker) {
        	  const markerPos = marker.getPosition()
              console.log('마커 저장쓰 ' +  markerPos.lat() + ', ' + markerPos.lng())
              alert('위치가 저장되었습니다')
              // 데이터베이스에 위도 경도 보내서 저장하면 될듯
          } else {
            alert('마커 저장안댐')
          }
        }
        
        function shareHandler() {
        	// 공유하는 창 불러오는 api 있을듯?	
        }
        
        function doMemo() {
            window.open('memo', '_blank', 'width=600, height=450')
        }
        
        initMap()
    </script>
    
</body>
</html>
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
		<h1>���� ��</h1>
		<hr>
	    <input id="place-search" type="text" placeholder="��� �˻�">
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

                // ������ ��Ŀ ����
                if (marker) {
                    marker.setMap(null)
                }

                // �ݺ���
                const bounds = new google.maps.LatLngBounds()
                places.forEach(function(place) {
                    if (!place.geometry) {
                        console.log("Returned place contains no geometry")
                        return
                    }

                    // ������ ��ҿ� ��Ŀ����
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
                                    			'<button id="save-marker" onclick="markerSaveHandler()">����</button>' +
                                    			'<button id="share" onclick="shareHandler()">����</button>' +
												'<button id="memo" onclick="doMemo()">�޸�</button>'
                                    		)
                                    infowindow.open(map, marker)
                                } else {
                                    window.alert('��� ����')
                                }
                            } else {
                                window.alert('�̰� ������ ������: ' + status)
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
//                 console.log('��Ŀ ���徲 ' +  markerPos.lat() + ', ' + markerPos.lng())
//                 // �����ͺ��̽��� ���� �浵 ������ �����ϸ� �ɵ�
//             } else {
//                 console.log("��Ŀ ����ȴ�")
//             }
//         })

        function markerSaveHandler() {
          if (marker) {
        	  const markerPos = marker.getPosition()
              console.log('��Ŀ ���徲 ' +  markerPos.lat() + ', ' + markerPos.lng())
              alert('��ġ�� ����Ǿ����ϴ�')
              // �����ͺ��̽��� ���� �浵 ������ �����ϸ� �ɵ�
          } else {
            alert('��Ŀ ����ȴ�')
          }
        }
        
        function shareHandler() {
        	// �����ϴ� â �ҷ����� api ������?	
        }
        
        function doMemo() {
            window.open('memo', '_blank', 'width=600, height=450')
        }
        
        initMap()
    </script>
    
</body>
</html>
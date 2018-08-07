<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지도1233</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=nVEUh5PrMsL3BXJq_8Pl&submodules=geocoder"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://127.0.0.1:8081/map/resources/script/myfunction.js" type="text/javascript"></script>
</head>
<script>
	window.onload = function() {
		sayHello();
		
		var map;
		makeCustomMap(map, "hak_1.jpg", "map1");
		var metaMap = getMetaMap(map);
		
		naver.maps.Event.addListener(map, 'click', function(e) {
			makeMarker(metaMap.nextMarkerName++, e.coord, metaMap);
		});
		
		document.getElementById("saveNode").addEventListener("click",function() {
			printInfo("printInfo", metaMap);
		});
		
		document.getElementById("loadNode").addEventListener("click",function() {
			loadNode($("#nodesInfo").val(), $("#graphInfo").val(), $("#selectableInfo").val(), metaMap)
		})
		
		document.getElementById("save").addEventListener("click",function() {
			console.log("save");
			ajaxSaveGraphAndNodes($("#saveId").val(), metaMap)
		});
		
		
		document.getElementById("load").addEventListener("click",function() {
			printInfo("one", metaMap);
			ajaxLoadGraphAndNodes($("#loadId").val(), metaMap)
		});
		
	};
</script>
<body id="body">
	<h1>${uploadedFile }</h1>

	<div id="map1" style="border: 1px solid black; height: 500px; width: 500px;"></div>
	<div>
	save ID : <input type="text" id="saveId"><button id="save">save</button>
	</div>
	<div>
	load ID : <input type="text" id="loadId"><button id="load">load</button>
	</div>
	<div id = "one"></div>
	<div id = "two"></div>
	nodesInfo :
	<input id="nodesInfo" type="text">
	<br> graphInfo :
	<input id="graphInfo" type="text">
	<br> selectableInfo :
	<input id="selectableInfo" type="text">
	<br>
	<button id="loadNode">loadNode</button>
	<button id="saveNode">saveNode</button>
	<div id="printInfo"></div>
	
</body>
</html>
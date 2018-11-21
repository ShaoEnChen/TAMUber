function getVehicleMarker(duty) {
	return {
		"lat": duty.vehicleLat,
		"lng": duty.vehicleLng,
		"picture": {
			"width":  180,
			"height": 32
		},
		"infowindow": getInfoWindow(duty)
	};
}

function getInfoWindow(duty) {
	let infoWindow = "";
	let vehicle = getHTMLTagString("p", "Vehicle#", `${duty.plateNumber}`);
	infoWindow += vehicle;
	let dName = getHTMLTagString("p", "Driver Name", `${duty.driverName}`);
	infoWindow += dName;
	let sName = getHTMLTagString("p", "Student Name", `${duty.studentName}`);
	infoWindow += sName;
	let sID = getHTMLTagString("p", "Student ID", `${duty.studentId}`);
	infoWindow += sID;
	return infoWindow;
}

function getHTMLTagString(tag, title, content) {
	return `<${tag}><b>${title}:</b> ${content}</${tag}>`;
}

function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(data) {
	var imgsrc, getLink, fileName, fullName, target;
	
	fullName = data;
	
	if (checkImageType(data)) {
		imgsrc = "/displayFile?fileName=" + data;
		var prefix = data.substring(0,12);
		var suffix = data.substring(14);
		getLink="/displayFile?fileName="+(prefix+suffix);
		var idx = data.indexOf('_', 14);
		fileName = data.substring(idx+1);
		target="_blank";
	} else {
		imgsrc = "/resources/img/general.jpg";
		getLink=data;
		var idx = data.indexOf('_');
		fileName = data.substring(idx+1);
	}
	
	return {imgsrc:imgsrc, getLink:getLink , fileName:fileName , fullName:fullName, target:target};
	
}
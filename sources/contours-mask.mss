Map {
	background-color: black;
}

#contours [class=1][zoom>=13] {
	line-color: white;
	line-width: 0.4;
}

#contours::major [class=2][zoom>=11] {
	line-color: white;
	line-width: 0.8;
	[zoom>=14] {
		text-name: "[ele_ft]";
		text-face-name: "DejaVu Serif Italic";
		text-fill: white;
		text-size: 9;
		text-halo-fill: black;
		text-halo-radius: 2;
		text-max-char-angle-delta: 20;
		text-placement: line;
		text-spacing: 300;
		text-avoid-edges: true;
	}
}

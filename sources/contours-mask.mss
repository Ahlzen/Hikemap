Map {
	background-color: black;
}

// Previously, the opacity was done in the TileStache stack,
// but for now we use different gray levels in the mask here
// and blend it directly.
// Opacity: z11-12 0.2, z13 0.35, z14+ 0.5

#contours [class=1][zoom>=13] {
	// line-color: white
	[zoom <= 12] { line-color: #333; }
	[zoom = 13]  { line-color: #555; }
	[zoom >= 14] { line-color: #888; }
	line-width: 0.4;
}

#contours::major [class=2][zoom>=11] {
	//line-color: white;
	[zoom <= 12] { line-color: #333; }
	[zoom = 13]  { line-color: #555; }
	[zoom >= 14] { line-color: #888; }
	line-width: 0.8;
	[zoom>=14] {
		text-name: "[ele_ft]";
		text-face-name: "DejaVu Serif Italic";
		//text-fill: white;
		text-fill: #888;
		text-size: 9;
		text-halo-fill: black;
		text-halo-radius: 2;
		text-max-char-angle-delta: 20;
		text-placement: line;
		text-spacing: 300;
		text-avoid-edges: true;
	}
}

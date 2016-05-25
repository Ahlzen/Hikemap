//// State borders

#stateBorderLines [zoom >= 5] {
  line-width:1;
  line-color: #640;
  
  // State outlines
  [zoom=4] { line-opacity: 0.05; }
  [zoom>=5] { line-opacity: 0.1; }
  [zoom>=6] { line-opacity: 0.15; }
  [zoom>=7] { line-opacity: 0.3; }
}

#stateLabels [zoom >= 5]
{
  // Center labels (exclude very small areas)
  [way_area > 1000000000][zoom<8] {
    text-face-name: @stateLabelFont;
    text-fill: #640;
    text-name: "[ref]";
    text-size: 8;
    text-halo-fill: white;
    text-halo-radius: 2;
    text-opacity: 0.6;
    text-label-position-tolerance: 15;
    [zoom>=5] {
      text-size: 11;
    }
    [zoom>=6] {
      text-name: "[name]";
      text-transform: uppercase;
      text-character-spacing: 4;
      text-size: 12;
    }
    [zoom=7] {
      text-size: 18;
      text-character-spacing: 8;
    }
  }
  
  // Borderlines/labels for higher zoom levels
  [zoom>=8] {
    ::borderHalo {
      line-width:4;
      line-color: #640;
      line-opacity: 0.1;
      line-offset: -2;
    }
    line-opacity: 1;
    line-dasharray: 1, 5;
    text-face-name: @stateBorderFont;
    text-placement: line;
    text-size: 10;
    text-fill: #640;
    text-halo-radius: 0;
    text-name: "[name]";
    text-dy: -11;
    text-max-char-angle-delta: 15;
    text-character-spacing: 4;
    text-spacing: 600;
  }
}


//// Park borders etc

#parks [zoom >= 10] {
  ::borderHalo {
      line-width: 4;
      line-offset: -2;
      [zoom = 14] { line-width: 6; line-offset: -3; }
      [zoom>= 15] { line-width: 8; line-offset: -4; }
      line-color: @parkcolor;
      line-opacity: 0.15;
  }
  line-width: 0.5;
  line-opacity: 0.5;
  [zoom >= 13] { line-width: 0.8; }
  line-color: @parkcolor;
}
 
#parkLabels [zoom >= 8] {
  [zoom >= 10][zoom <= 11][way_area > 10000000],
  [zoom >= 12][zoom <= 13][way_area > 2000000] {
    ::centerlabels {
    text-face-name: @parkfont;
    text-halo-fill: @parkhalo;
    text-halo-radius: 1.5;
    text-fill: @parkcolor;
    text-name: "[name]";
    text-size: 12;
    [zoom >= 12] { text-size: 13; }
  }}
  [zoom >= 12][zoom <= 13][way_area > 2000000],
  [zoom >= 14][way_area > 500000] {
    // Boundary labels
    text-face-name: @parkfont;   
    text-halo-fill: @parkhalo;
    text-halo-radius: 1.0;
    text-fill: @parkcolor;
    text-name: "[name]";
    text-size: 11;
    text-placement: line;
    text-dy: -13;
    text-spacing: 500;
    text-min-distance: 500;
    text-max-char-angle-delta: 20;
    text-character-spacing: 2;
  }
}

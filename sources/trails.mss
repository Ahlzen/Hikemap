//// Trail networks (highlights/shields)

#trailNetworks [zoom >= 8]
{
  line-color: @trailnetworkbg;
  line-opacity: 0.25;
  [zoom <= 11] { line-width: 3px; }
  [zoom >= 12] { line-width: 5px; }
}

#trailNetworkShields [zoom >= 10]
{
  [ref='AT'] {
    shield-placement: line;
    shield-face-name: @roadshieldfont;
    shield-min-distance: 50;
    shield-spacing: 300;
    shield-file: url(../symbols/at.svg);
    shield-name: "";
    shield-transform: scale(1.6, 1.6);
  }
}


//// Trails

#trails [zoom>=10][zoom<=11]
{ 
  line-color: @trailcolor;
  line-width: 0.7;
  [highway='bridleway'],
  [highway='track'] {
    line-dasharray: 5, 2;
  }
  [highway='footway'],
  [highway='path'] {
    line-dasharray: 3, 1.5;
  } 
}

#trails [zoom>=12][zoom<=13]
{

  //::background {
  //  line-width: 3;
  //  line-color: @trailbg; }

  //::fill {
    line-color: @trailcolor;
    line-width: 1.2;
    [highway='bridleway'],
    [highway='track'] {
      line-dasharray: 8, 2;
    }
    [highway='footway'],
    [highway='path'] {
      line-dasharray: 4, 2;
    }
  //}
}

#trails [zoom>=14]
{
  line-width: 0;
  line-color: @trailcolor;
  
  [highway='track'],
  [highway='bridleway'] {
    //[bridge='yes'] { line-width: 6.5; line-color: fadeout(black, 30%); }
    //::background { line-width: 4.5; line-color: @trailbg; }
    //::fill {
    [bridge='yes'] {
        line-width: 5.0;
        line-color: black;
        ::midfill {
          line-width: 3.5;
          line-color: white;
        }
      }
    line-width: 1.5;
    line-dasharray: 12, 2;
    [tracktype='grade5'] { line-dasharray: 7, 2; }
    [tracktype='grade4'] { line-dasharray: 9, 2; }
    [tracktype='grade3'] { line-dasharray: 11, 2; }
    [tracktype='grade2'] { line-dasharray: 13.5, 2; }
    [tracktype='grade1'] { line-dasharray: 15, 2; }
    //}
  }
  
  [highway='footway'],
  [highway='path']
  {
    // Minor/overgrown trails
    [trail_visibility='intermediate'],
    [trail_visibility='bad'],
    [trail_visibility='horrible']
    {
      [bridge='yes'] {
        line-width: 4.7;
        line-color: black;
        ::midfill {
          line-width: 3.2;
          line-color: white;
        }
      }
      ::fill {
        line-width: 1.2;
        line-dasharray: 5, 2;
      }
    }
    
    // Normal trails
    [trail_visibility=''],
    [trail_visibility='good'],
    [trail_visibility='excellent']
    {
      [bridge='yes'] {
        line-width: 5.0;
        line-color: black;
        ::midfill {
          line-width: 3.5;
          line-color: white;
        }
      }
      ::fill {
        line-width: 1.5;
        line-dasharray: 5, 2;
      }
    }
  }
  
  [highway='cycleway'] {
    [bridge='yes'] {
      line-width: 5.0;
      line-color: black;
      ::midfill {
        line-width: 3.5;
        line-color: white;
      }
    }
    ::fill { line-width: 1.5; }
  }
}


#traillabels [zoom >= 13] {
  text-name: "[short_name]";
  text-size: 10;
  text-face-name: @traillabelfont;
  text-character-spacing: 1;
  text-max-char-angle-delta: 30;
  //text-transform: uppercase;
  text-placement: line;
  //text-halo-fill: rgb(255,255,255,0.4);
  //text-halo-radius: 1;
  text-dy: 7;
  [zoom >= 15] {
    text-name: "[name]";
    text-size: 12;
    text-dy: 8;
  }
}
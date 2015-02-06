// TODO: Highlight major trail networks, like AT


#trails [zoom>=10][zoom<=11]
{ 
  line-color: @trailcolor;

  [highway='bridleway'],
  [highway='track'] {
    line-width: 0.8;
    line-dasharray: 5, 2;
    line-color: @trailcolor;
  }

  [highway='footway'],
  [highway='path'] {
    line-width: 0.7;
    line-dasharray: 2, 1.5;
  } 
    
  [highway='cycleway'] {
    line-width: 0.7;
  }
}


#trails [zoom>=12][zoom<=13]
{ 
  line-color: @trailcolor;
  
  [highway='bridleway'],
  [highway='track']
  {
    line-width: 1.0;
    line-dasharray: 8, 2;
  }

  [highway='footway'],
  [highway='path'] {
    line-width: 0.9;
    line-dasharray: 3, 1.5;
  }
  
  [highway='cycleway'] {
    line-width: 0.9;
  }
}


#trails [zoom>=14]
{
  line-color: @trailcolor;
  
  [highway='track'],
  [highway='bridleway'] {
    [bridge='yes'] { line-width: 6.5; line-color: fadeout(black, 30%); }
    ::background { line-width: 4.5; line-color: white; }
    ::fill {
      line-width: 2.0;
      line-dasharray: 12, 2;
      [tracktype='grade5'] { line-dasharray: 7, 2; }
      [tracktype='grade4'] { line-dasharray: 9, 2; }
      [tracktype='grade3'] { line-dasharray: 11, 2; }
      [tracktype='grade2'] { line-dasharray: 13.5, 2; }
      [tracktype='grade1'] { line-dasharray: 15, 2; }
    }
  }
  
  [highway='footway'],
  [highway='path']
  {
    // Minor/overgrown trails
    [trail_visibility='intermediate'],
    [trail_visibility='bad'],
    [trail_visibility='horrible']
    {
      [bridge='yes'] { line-width: 5.5; line-color: fadeout(black, 30%); }
      ::background { line-width: 3.5; line-color: white; }
      ::fill {
        line-width: 1.0;
        line-dasharray: 4, 2;
      }
    }
    
    // Normal trails
    [trail_visibility=''],
    [trail_visibility='good'],
    [trail_visibility='excellent']
    {
      [bridge='yes'] { line-width: 6; line-color: fadeout(black, 30%); }
      ::background { line-width: 4; line-color: white; }
      ::fill {
        line-width: 1.5;
        line-dasharray: 4, 2;
      }
    }
  }
  
  [highway='cycleway'] {
    [bridge='yes'] {
      line-width: 6; line-color: fadeout(@trailcolor, 30%);
      //::midfill { line-width: 4; line-color: fadeout(black, 30%); }
    }
    ::background { line-width: 4; line-color: white; }
    ::fill { line-width: 1.5; }
  }
}

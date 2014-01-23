function circles(elementId){
      var div = document.getElementById(elementId);
      var countTotal = div.getAttribute('data-count-total');
      var countUnique = div.getAttribute('data-count-unique');
      var labelTotal = div.getAttribute('data-label-total');
      var labelUnique = div.getAttribute('data-label-unique');

      var canvas = document.createElement('canvas');
      var context = canvas.getContext('2d');
      canvas.width = 460;
      canvas.height = 240;
      canvas.style.left = '25%';
      canvas.style.position = 'absolute';
      
      var radius = 120;

      // left circle
      var centerX = 120;
      var centerY = canvas.height / 2;
      
      context.globalAlpha = 0.5;
      context.beginPath();
      context.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
      context.fillStyle = '#e98e4e';
      context.fill();
      
      // right circle
      centerX = 320;
      centerY = canvas.height / 2;
      
      context.globalAlpha = 0.5;      
      context.beginPath();
      context.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
      context.fillStyle = '#7d9aaa';
      context.fill();
      
      div.appendChild(canvas);
}

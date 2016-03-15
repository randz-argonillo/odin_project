

$(document).ready(function(){
  var currentPointerSize = 1;

  populatePointerSize();
  fillInGrid(currentPointerSize);

  // draw
  $('.canvas').on('mousedown', 'div', function(e){
    e.stopPropagation();
    var cssColor;

    if($('.toggle-button').hasClass('toggle-button-selected')){
      cssColor = {'background-color': '#ffffff'};
    } else {
      cssColor = {'background-color': $('#color-picker').val()};
    }

    $(this).css(cssColor);
    $('.canvas').on('mouseover', 'div', function(){
      $(this).css(cssColor);
    });

  });

  // stop drawing
  $('.canvas').on('mouseup', 'div', function(){
    $('div').unbind('mouseover');
  });


  // fill in canvas after user change the pointer size
  $('#pointer-size').change(function(){
    var $list = $(this);
    
    $('body').css({'cursor': 'progress'});

    if(currentPointerSize === $list.val()){
      return;
    }
    
    currentPointerSize = $list.val();
    $('.canvas').empty();
    fillInGrid(currentPointerSize);

    $('body').css({'cursor': 'default'});
  });

  // toggle eraser
  $('.toggle-button').click(function(){
    $(this).toggleClass('toggle-button-selected');
  });


});

var fillInGrid = function(pointSize){
  
  var $canvas = $('.canvas');
  var squareSize = { width: pointSize * 5, height: pointSize * 5 };
  var canvasWidth = $canvas.width();
  var canvasHeight = $canvas.height();
  var progbarIncrement = 100 / (canvasHeight / squareSize.height);


  $('body').css({'cursor': 'progress'});
  setupProgressbar();

  var row = 0;
  var barCounter = 0;
  var counter = 0;    

  (function populateRows(){ 
    row += squareSize.height;

    if(row <= canvasHeight){
      for(var col = squareSize.width; col <= canvasWidth; col += squareSize.width){
        var $div = $('<div class="box" data-row="' + row / squareSize.width + '"></div>');
        $canvas.append(
          $div.css({'width': squareSize.width, 'height': squareSize.height })
        );
      }

      barCounter += progbarIncrement;
      counter++;
      setTimeout(function(){updateProgressbar(barCounter);},0);
      setTimeout(populateRows, 0);
    } else {
      hideProgressbar();
    }

  })();

  $('body').css({'cursor': 'default'});


};

var populatePointerSize = function(){
  var $list = $('#pointer-size');
  
  for(var i=1; i <= 10; i++){
    $list.append('<option value="'+ i +'">' + i + '</option>');
  }

};

var setupProgressbar = function(){
  var $container = $('.container');
  var $bar = $('#progressbar');

  $container.height($container.height() + 20);
  $bar.show();

  $bar.progressbar({
    value: 0,
    max: 100
  });

};


var updateProgressbar = function(interval){
  var $bar = $('#progressbar');
  var val = $bar.progressbar('value') + interval;
  $bar.progressbar('value', val);
};

var hideProgressbar = function(){
  var $container = $('.container');
  var $bar = $('#progressbar');

  $container.height($container.height() - 20);
  $bar.hide();

};




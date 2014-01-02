var toggleActive = function(){
  $( this ).toggleClass( active );
}

$( li ).hover(toggleActive, toggleActive);


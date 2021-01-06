$(function() {
  $('.slider').slick({
    speed: 1000,
    dots: true,
    prevArrow: false,
    nextArrow: false
  });
});

$(function() {
  $('.variable-width').slick({
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true,
    arrows:	true,
    centerPadding: '2%'
  });
});
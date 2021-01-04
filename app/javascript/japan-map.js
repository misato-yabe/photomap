$(function(){

// ーーここからーーーーーーーー
var areaLinks = {
  1:"javascript:void(0)",
  2:"javascript:void(0)",
  3:"http://rmtmhome.com",
  4:"http://rmtmhome.com",
  5:"http://rmtmhome.com",
  6:"javascript:void(0)",
  7:"javascript:void(0)",
  8:"javascript:void(0)",
  9:"javascript:void(0)"
   };

   var areas = [
    {code : 1, name: "", color: "#aaa", hoverColor: "#aaa", prefectures: [1]},
    {code : 2, name: "",   color: "#aaa", hoverColor: "#aaa", prefectures: [2,3,4,5,6,7]},
    {code : 3, name: "関東",   color: "#7ecfea", hoverColor: "#b7e5f4", prefectures: [8,9,10,11,12,13,14]},
    {code : 4, name: "中部",   color: "#7cdc92", hoverColor: "#aceebb", prefectures: [15,16,17,18,19,20,21,22,23]},
    {code : 5, name: "近畿",   color: "#ffe966", hoverColor: "#fff19c", prefectures: [24,25,26,27,28,29,30]},
    {code : 6, name: "",   color: "#aaa", hoverColor: "#aaa", prefectures: [31,32,33,34,35]},
    {code : 7, name: "",   color: "#aaa", hoverColor: "#aaa", prefectures: [36,37,38,39]},
    {code : 8, name: "",   color: "#aaa", hoverColor: "#aaa", prefectures: [40,41,42,43,44,45,46]},
    {code : 9, name: "",   color: "#aaa", hoverColor: "#aaa", prefectures: [47]},
];


// ーーここまでーーーーーーーー




  $("#map-container").japanMap({
      width:600,
            areas  : areas,
                      selection : "area",
                      borderLineWidth: 0.25,
                      drawsBoxLine : false,
                      movesIslands : true,
                      showsAreaName : true,
                      font : "MS Mincho",
                      fontSize : 13,
        fontColor  :"#777",
        fontShadowColor : "white",
      onSelect : function(data){
          // alert(data.name);
      location.href = areaLinks[data.area.code];
      }
    });
});
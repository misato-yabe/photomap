  $(function(){
      $("#map-container").japanMap({
          onSelect : function(data){
              alert(data.name);
          }
      });
  });
// //検索ページ日本地図
// $(function(){
//   //8地方でリンク作成
//   var areaLinks = {
//     1:"/user/index?sort=hokkaido",
//     2:"/user/index?sort=tohoku",
//     3:"/user/index?sort=kanto",
//     4:"/user/index?sort=chubu",
//     5:"/user/index?sort=kinki",
//     6:"/user/index?sort=chugoku_shikoku",
//     7:"/user/index?sort=kyusyu_okinawa",
//   };

//   //8地方エリア指定
//   var areas = [
//     {code : 1, name: "北海道", color: "#ab86c4", hoverColor: "#dfcceb", prefectures: [1]},
//     {code : 2, name: "東北",   color: "#6d93d1", hoverColor: "#91b0e3", prefectures: [2,3,4,5,6,7]},
//     {code : 3, name: "関東",   color: "#f5a164", hoverColor: "#f5c09a", prefectures: [8,9,10,11,12,13,14]},
//     {code : 4, name: "中部",   color: "#77e077", hoverColor: "#adedad", prefectures: [15,16,17,18,19,20,21,22,23]},
//     {code : 5, name: "近畿",   color: "#ffe966", hoverColor: "#fff2a3", prefectures: [24,25,26,27,28,29,30]},
//     {code : 6, name: "中国・四国",   color: "#e68ccc", hoverColor: "#f0b9e0", prefectures: [31,32,33,34,35,36,37,38,39]},
//     {code : 7, name: "九州・沖縄",   color: "#de6474", hoverColor: "#f29da9", prefectures: [40,41,42,43,44,45,46,47]},
//   ];

//   //地図表示設定
//   $("#map-container").japanMap({
//     width: 600,
//     areas  : areas,
//     selection : "area",
//     borderLineWidth: 0.25,
//     drawsBoxLine : false,
//     movesIslands : true,
//     showsAreaName : true,
//     font : "MS Mincho",
//     fontSize : 13,
//     fontColor :"#777",
//     fontShadowColor : "white",
//     onSelect : function(data){
//     location.href = areaLinks[data.area.code];
//   };
// });
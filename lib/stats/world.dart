class Wcases{

var cases;
var recovered;
var deaths;
var active;
 
 Wcases({this.active,this.cases,this.deaths,this.recovered});
factory Wcases.fromJson(final json){
return Wcases(
  cases:json['cases'],
  active: json['active'],
  recovered: json['recovered'],
  deaths : json['deaths'],
);

}}
xquery version "3.1";

declare function local:indirect($entity as xs:string?, $com as xs:string?, $p as xs:decimal?)
as xs:decimal?
{
    let $d := doc("test.xml")/entities
    let $dir := local:direct($entity,$com)
    return (($p * $dir) + sum(
    for $c in $d//entity[id=$entity]/owns/own[shares>0]/cid
        let $ind := ($p * local:direct($entity,$c))
        let $control := if($p<0.0000001) then 0 else local:indirect($c,$com,$ind)
    return $control
      ))
};

declare function local:direct($entity as xs:string?,$com as xs:string?)
as xs:decimal?
{
    let $d := doc("test.xml")/entities
    let $num := $d//entity[id=$entity]/owns/own[cid=$com and shares>0]/shares
    let $tot := $d/company[entity/id=$com]/shares
    return xs:decimal($num div $tot)
};

<query5>

<!--I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else.

CSE Project 3
Name: Shubham Kumar Jain
SBU ID: 111482623
Brief Description: Query 5 shows the percentage of companies owned by the persons. -->   

{
let $d := doc("test.xml")/entities
for $p in $d/person
    for $c in $d/company
        let $perc := round-half-to-even((xs:decimal(local:indirect($p/entity/id,$c/entity/id,1) * 100)),4)
        where $perc>=10
    order by $p/entity/name,$c/entity/name
    return <shareholders><person>{$p/entity/name/text()}</person><company>{$c/entity/name/text()}</company><percentage>{xs:decimal(sum($perc))}</percentage></shareholders>
}
</query5>
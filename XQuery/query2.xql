xquery version "3.1";

<query2>

<!--I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else.

CSE Project 3
Name: Shubham Kumar Jain
SBU ID: 111482623
Brief Description: Query 2 shows the networth of every person. -->  

{
let $d := doc("test.xml")/entities
for $p in $d/person
    for $c in $d/company
    where $c/entity[id=$p/entity/owns/own/cid]
        let $shares := $p/entity/owns/own[cid=$c/entity/id and shares>0]/shares
        let $price := $c/shareprice 
        let $netw := ($shares * $price)
group by $p
order by $p/entity/name
return <person><name>{$p/entity/name/text()}</name><networth>{xs:decimal(sum($netw))}</networth></person>
}
</query2>
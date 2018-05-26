xquery version "3.1";

<query3>

<!--I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else.

CSE Project 3
Name: Shubham Kumar Jain
SBU ID: 111482623
Brief Description: Query 3 shows the top board member of each company. -->    

{
let $d := doc("test.xml")/entities
for $c in $d/company
    for $p in $d/person
        where $p/entity[id=$c/board/member/pid]/owns/own[cid=$c/entity/id 
        and shares>0 
        and shares=max($p/entity[id=$c/board/member/pid]/owns/own[cid=$c/entity/id]/shares)]
order by $c/entity/name
return <company><name>{$c/entity/name/text()}</name><top_board_member>{$p/entity/name/text()}</top_board_member></company>
}
</query3>
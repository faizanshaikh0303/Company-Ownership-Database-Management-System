xquery version "3.1";

<query1>

<!--I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else.

CSE Project 3
Name: Shubham Kumar Jain
SBU ID: 111482623
Brief Description: Query 1 shows the companies that are partially owned by one of their board members. --> 

{
let $d := doc("test.xml")/entities
for $c in $d/company
    for $p in $d/person[entity/id = $c/board/member/pid]
        where $p/entity/owns/own[cid = $c/entity/id]/shares > 0
group by $c
order by $c/entity/name
return <company>{$c/entity/name/text()}</company>
}
</query1>
xquery version "3.1";

<query4>

<!--I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else.

CSE Project 3
Name: Shubham Kumar Jain
SBU ID: 111482623
Brief Description: Query 4 shows the pair of companies where company1 dominates company2 -->  

{
let $d := doc("test.xml")/entities
for $c1 in $d/company
    for $c2 in $d/company[entity/id != $c1/entity/id and industries/industry=$c1/industries/industry]
        where every $p2 in $d/person[entity/id=$c2/board/member/pid]/entity/owns/own
        satisfies (
            $d/person[entity/id=$c1/board/member/pid]/entity/owns/own[cid=$p2/cid]/shares >= xs:integer($p2/shares)
           )
return <company><cname1>{$c1/entity/name/text()}</cname1><cname2>{$c2/entity/name/text()}</cname2></company>
}
</query4>
<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
                <th>Probability</th>
            </tr>
            {
            let $target := collection("?select=*.xml")//w[lower-case(normalize-space()) = "has"],
                $x := $target/lower-case(normalize-space(following-sibling::w[1]))
            for $s in distinct-values($x) 
            let $i := count($x[.=$s]),
                $j := count(collection("?select=*.xml")//w[lower-case(normalize-space()) = $s]),
                $problong := $i div $j
            let $p := round-half-to-even($problong, 2)
            order by $p descending
            return
            <tr>
                <td> {$target[1]} </td>
                <td> {$s} </td>
                <td> {$p} </td>
            </tr>
            }
        </table>
    </body>
</html>
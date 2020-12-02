<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
                <th>Frequency</th>
            </tr>
            {
            let $target := collection("?select=*.xml")//w[lower-case(normalize-space()) = "has"],
                $s := $target/lower-case(normalize-space(following-sibling::w[1]))
            for $x in distinct-values($s) 
            let $freq := count($s[.=$x])
            order by $freq descending
            return
            <tr>
                <td> {$target[1]} </td>
                <td> {$x} </td>
                <td> {$freq} </td>
            </tr>
            }
        </table>
    </body>
</html>
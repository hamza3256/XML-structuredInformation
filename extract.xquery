<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
            </tr>
            {
            for $w in collection("?select=*.xml")//w
            let $target := normalize-space(lower-case($w)),
                $s := normalize-space(lower-case($w/following-sibling::w[1]))
            where $target = 'has'
            return
            <tr>
                <td> {$target} </td>
                <td> {$s} </td>
            </tr>
            }
        </table>
    </body>
</html>
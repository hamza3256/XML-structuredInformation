<html>
    <body>
        <table
            border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
                <th>Probability</th>
            </tr>
            {
            let $target := collection("?select=*.xml")//w[lower-case(normalize-space()) = "has"],
                $words := $target/lower-case(normalize-space(following-sibling::w[1])),
                $j := distinct-values($words),
                $list :=
                for $word at $i in $j
                let $x := count($words[. = $word]),
                    $c := count(collection("?select=*.xml")//w[lower-case(normalize-space()) = $word]),
                    $problong := $x div $c
                let $p := round-half-to-even($problong, 2)
                    order by $p descending
                return
                    $p
            for $p at $i in subsequence($list, 1, 20)
            return
                <tr>
                    <td>
                        {$target[1]}
                    </td>
                    <td>
                        {$j[$i]}
                    </td>
                    <td>
                        {$p}
                    </td>
                </tr>
            }
        </table>
    </body>
</html>
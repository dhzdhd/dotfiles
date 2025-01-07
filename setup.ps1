$obj = ($json  | ConvertFrom-Json)

ForEach($item in $obj) {
    $filename = "$($item.title).yaml"
    $item | ConvertTo-YAML > $filename
    "---" >> $filename
}
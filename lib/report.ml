open Model
let format_for_report penpal =
  (String.concat "\n" [penpal.name; penpal.address]) ^ "\n"

let make_report penpals =
  penpals
  |> List.map format_for_report
  |> String.concat "\n"
  |> String.cat "You have not written to:\n\n"

open Model

let format_for_report penpals =
  List.map
    (fun penpal ->
      (String.concat
        "\n" [penpal.name; penpal.address]) ^ "\n"
    )
    penpals

let prepend_message formatted_penpals =
  formatted_penpals
  |> String.concat "\n"
  |> String.cat "You have not written to:\n\n"

let make_report penpals =
  penpals
  |> format_for_report
  |> prepend_message

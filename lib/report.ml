open Model

let format_for_report penpals =
  List.map
    (fun penpal ->
      (String.concat
        "\n" [penpal.name; penpal.address]) ^ "\n"
    )
    penpals

let join_them_together formatted_penpals =
  formatted_penpals
  |> String.concat "\n"

let prepend_message report_so_far =
  String.cat
    "You have not written to:\n\n"
    report_so_far

let make_report penpals =
  penpals
  |> format_for_report
  |> join_them_together
  |> prepend_message

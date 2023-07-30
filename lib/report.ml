open Penpal

let format_languages languages =
    let is_last index =
      index == (List.length languages) - 1 in

      Seq.fold_lefti
        (fun result_so_far index language ->
          let separator =
            if is_last index then
              ""
            else if index == (List.length languages - 2) then
              " and "
            else
              ", "
          in
            result_so_far ^ language ^ separator
        )
        ""
        (List.to_seq languages)

let format_for_report penpals =
  List.map
    (fun penpal ->
      (String.concat
        "\n"
        [penpal.name; penpal.address]
      ) ^
      "\n\n" ^
      "who writes in " ^ (format_languages penpal.languages) ^
      "\n"
    )
    penpals

let join_them_together formatted_penpals =
  String.concat "--\n" formatted_penpals

let prepend_message report_so_far =
  String.cat
    "You have not written to:\n\n"
    report_so_far

let is_empty penpals =
  (List.length penpals) == 0

let make_report penpals =
  if is_empty penpals then
    "You have written to everyone on the list\n"
  else
    penpals
    |> format_for_report
    |> join_them_together
    |> prepend_message

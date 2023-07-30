open Penpal

let format_languages languages =
    let on_last index =
      index == (List.length languages) - 1 in

    let on_penultimate index =
      index == (List.length languages - 2) in

      Seq.fold_lefti
        (fun result_so_far index language ->
          let separator =
            if on_last index then
              ""
            else if on_penultimate index then
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
      penpal.name ^
      "\n" ^
      penpal.address ^
      "\n\n" ^
      "who writes in " ^ (format_languages penpal.languages) ^
      "\n"
    )
    penpals

let join_them_together formatted_penpals =
  String.concat "--\n" formatted_penpals

let prepend_message report_so_far =
  "You have not written to:\n\n" ^
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

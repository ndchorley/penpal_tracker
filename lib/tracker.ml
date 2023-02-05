open File
open Model
open Parsing
open Report

let only_those_not_sent_a_letter penpals_result =
  Result.map
    (fun penpals ->
      List.filter
        (fun penpal -> Bool.not penpal.letter_sent)
        penpals
    )
    penpals_result

let track_penpals list_file =
  let result =
    list_file
    |> read_lines
    |> drop_header
    |> parse_penpals
    |> only_those_not_sent_a_letter in

      match result with
      | Ok (penpals) -> make_report penpals
      | _ -> ""

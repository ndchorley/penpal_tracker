open File
open Filtering
open Parsing
open Report

let track_penpals list_file =
  let result =
    list_file
    |> read_lines
    |> drop_header
    |> parse_penpals
    |> only_those_not_sent_a_letter in

      match result with
      | Ok (penpals) -> make_report penpals
      | Error (message) -> message

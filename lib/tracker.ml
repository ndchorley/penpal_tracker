open File
open Model
open Parsing
open Report

let only_those_not_sent_a_letter penpals =
  List.filter
    (fun penpal -> Bool.not penpal.letter_sent)
    penpals

let track_penpals list_file =
  list_file
  |> read_lines
  |> drop_header
  |> parse_penpals
  |> only_those_not_sent_a_letter
  |> make_report

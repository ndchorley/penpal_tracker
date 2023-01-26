open Model
open Parsing
open Report

let read_lines list_file =
  let rec loop channel lines_so_far =
    let line =
      try Some (input_line channel) with
      End_of_file -> None in

    match line with
    | Some (line) ->
      loop channel (List.append lines_so_far [line])
    | None -> lines_so_far in

  let channel = open_in list_file in

  let lines = loop channel [] in

  let _ = close_in channel in
      lines

let drop_header lines =
  lines
  |> List.tl
  |> List.tl

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

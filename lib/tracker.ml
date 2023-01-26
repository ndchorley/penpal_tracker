open Parsing
open Model

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

let format_for_report penpal =
  (String.concat "\n" [penpal.name; penpal.address]) ^ "\n"

let make_report penpals =
  penpals
  |> List.map format_for_report
  |> String.concat "\n"

let track_penpals list_file =
  list_file
  |> read_lines
  |> drop_header
  |> parse_penpals
  |> make_report

let read_line list_file =
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
    List.nth lines 2

let parse_penpal line =
  String.split_on_char '|' line

let format_for_report penpal =
  (String.concat "\n" penpal) ^ "\n"

let track_penpals list_file =
  list_file
  |> read_line
  |> parse_penpal
  |> format_for_report

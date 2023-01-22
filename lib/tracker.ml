let read_line list_file =
  let channel = open_in list_file in

  let _ = input_line channel in
  let _ = input_line channel in

  let line = input_line channel in

  let _ = close_in channel in
    line

let parse_penpal line =
  String.split_on_char '|' line

let format_for_report penpal =
  (String.concat "\n" penpal) ^ "\n"

let track_penpals list_file =
  list_file
  |> read_line
  |> parse_penpal
  |> format_for_report

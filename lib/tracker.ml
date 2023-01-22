let read_line list_file =
  let channel = open_in list_file in

  let _ = input_line channel in
  let _ = input_line channel in

  let line = input_line channel in

  let _ = close_in channel in
    line

let track_penpals list_file =
  let parts =
    list_file
    |> read_line
    |> String.split_on_char '|' in

    (String.concat "\n" parts) ^ "\n"

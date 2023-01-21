let track_penpals list_file =
  let channel = open_in list_file in

  let _ = input_line channel in
  let _ = input_line channel in

  let line = input_line channel in

  let _ = close_in channel in

  let parts = String.split_on_char '|' line in
    (String.concat "\n" parts) ^ "\n"

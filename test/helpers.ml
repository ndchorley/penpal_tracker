let contents_of file =
  open_in file |> In_channel.input_all

let contains string wanted =
  try (
    let _ =
      Str.search_forward (Str.regexp wanted) string 0
    in
      true
  ) with
    _ -> false

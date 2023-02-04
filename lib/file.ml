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
      Result.ok lines

let drop_header lines_result =
  Result.map
    (fun lines ->
      lines
      |> List.tl
      |> List.tl
    )
    lines_result

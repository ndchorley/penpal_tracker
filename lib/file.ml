open Result_from

let rec loop channel lines_so_far =
  let line =
    try Some (input_line channel) with
      End_of_file -> None in

    match line with
    | Some (line) ->
      loop channel (List.append lines_so_far [line])
    | None -> lines_so_far

let read_lines list_file =
  let channel_result =
      result_from (fun _ -> open_in list_file) in

    match channel_result with
    | Ok (channel) ->
        let lines_result = Ok (loop channel []) in
        let _ = close_in channel in
          lines_result
    | _ ->
      Error
        ("Couldn't find penpal list at " ^ list_file ^ "\n")

let drop_header lines_result =
  Result.map
    (fun lines ->
      lines
      |> List.tl
      |> List.tl
    )
    lines_result

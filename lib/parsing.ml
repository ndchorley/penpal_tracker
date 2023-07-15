open Model

let parse_penpal line =
  let parts = (String.split_on_char '|' line) in
    {name = (List.nth parts 0);
     address = (List.nth parts 1);
     languages = (List.nth parts 2);
     letter_sent = (String.contains (List.nth parts 3) 'x')}

let parse_penpals lines_result =
  Result.map
    (fun lines ->
      List.map
        parse_penpal
        lines
    )
    lines_result

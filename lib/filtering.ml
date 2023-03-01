open Model

let only_those_not_sent_a_letter penpals_result =
  Result.map
    (fun penpals ->
      List.filter
        (fun penpal -> Bool.not penpal.letter_sent)
        penpals
    )
    penpals_result

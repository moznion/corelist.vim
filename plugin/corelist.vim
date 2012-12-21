command! -nargs=* Corelist call Corelist(<f-args>)

func! Corelist(moduleName)
  let messages = split(system('corelist ' . a:moduleName), "\n")

  let msg = messages[0]
  if len(messages) == 2 " For new Module::CoreList
    let msg .= "\n" . messages[1]
    let isCore = s:IsCore(messages[1])
  else
    let isCore = s:IsCore(messages[0])
  endif

  if isCore == 1
    call s:Core(msg)
  else
    call s:NotCore(msg)
  endif
endf

func! s:IsCore(msg)
  if !match(a:msg, ".*was not in CORE")
    return 0
  endif
  return 1
endf

func! s:NotCore(msg)
  echohl WarningMsg
  echo   a:msg
  echohl None
endf

func! s:Core(msg)
  echohl Function
  echo   a:msg
  echohl None
endf

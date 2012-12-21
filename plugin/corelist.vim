command! -nargs=* Corelist call Corelist(<f-args>)

func! Corelist(moduleName)
  let l:messages = split(system('corelist ' . a:moduleName), "\n")

  let l:msg = l:messages[0]
  if len(l:messages) == 2 " For new Module::CoreList
    let l:msg .= "\n" . l:messages[1]
    let l:isCore = s:IsCore(l:messages[1])
  else
    let l:isCore = s:IsCore(l:messages[0])
  endif

  if l:isCore == 1
    call s:Core(l:msg)
  else
    call s:NotCore(l:msg)
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
